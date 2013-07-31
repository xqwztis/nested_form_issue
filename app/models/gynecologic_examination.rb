# encoding: UTF-8
class GynecologicExamination < ActiveRecord::Base
  belongs_to :left_ovary, :class_name => 'GynecologicExamination::Ovary', :dependent => :destroy
  belongs_to :right_ovary, :class_name => 'GynecologicExamination::Ovary', :dependent => :destroy
  belongs_to :ovaries
  has_many :myometric_structure_nodes, :class_name => 'GynecologicExamination::MyometricStructureNode', :dependent => :destroy
  accepts_nested_attributes_for :myometric_structure_nodes, :allow_destroy => true
  has_many :endometrium_echostructure_hyperechoic_inclusions, :class_name => 'GynecologicExamination::EndometriumEchostructureHyperechoicInclusion', :dependent => :destroy
  accepts_nested_attributes_for :endometrium_echostructure_hyperechoic_inclusions, :allow_destroy => true
  has_many :patient_examinations
  has_many :patients, :through => :patient_examinations
  accepts_nested_attributes_for :left_ovary, :allow_destroy => true
  accepts_nested_attributes_for :right_ovary, :allow_destroy => true
  attr_accessible :menstruation_date
  attr_accessible :menstruation_day
  attr_accessible :uterine_length
  attr_accessible :uterine_anteroposterior
  attr_accessible :myometric_structure_nodes_attributes
  attr_accessible :endometrium_echostructure_hyperechoic_inclusions_attributes
  attr_accessible :left_ovary_id, :left_ovary
  attr_accessible :right_ovary_id, :right_ovary
  attr_accessible :left_ovary_attributes
  attr_accessible :right_ovary_attributes
  
  validate :uterine_attributes
  
  def uterine_attributes
    if uterine_body_visibility.value == 'определяется'
      # дата последней менструации
      if !menstruation_date.nil? && menstruation_day.nil?
        errors.add(:menstruation_day, "Не задано значение")
      end
      
      # тело матки
      if uterine_body_detection_position.value == '-- не задано --'
        errors.add(:uterine_body_detection_position_id, "Не задано значение")
      end
      if uterine_boundary.value == '-- не задано --'
        errors.add(:uterine_boundary_id, "Не задано значение")
      end
      if uterine_adumbration.value == '-- не задано --'
        errors.add(:uterine_adumbration_id, "Не задано значение")
      end
      if uterine_shape.value == '-- не задано --'
        errors.add(:uterine_shape_id, "Не задано значение")
      end
      if uterine_size.value == '-- не задано --'
        errors.add(:uterine_size_id, "Не задано значение")
      end
      if uterine_length.nil? || uterine_length == 0
        errors.add(:uterine_length, "Значение не задано или недопустимо")
      end
      if uterine_anteroposterior.nil? || uterine_anteroposterior == 0
        errors.add(:uterine_anteroposterior, "Значение не задано или недопустимо")
      end
      if uterine_width.nil? || uterine_width == 0
        errors.add(:uterine_width, "Значение не задано или недопустимо")
      end
      
      if uterine_cavity_size_change.value == 'расширена'
        if uterine_cavity_size.nil? && !is_uterine_cavity_node_present
          errors.add(:uterine_cavity_size, "Не задано значение")
          errors.add(:is_uterine_cavity_node_present, "Не задано значение")
        end
      end
      
      # миометрий
      if myometric_structure_change.value == 'изменена'
        if myometrium_anterior_wall_thickness.nil? || myometrium_anterior_wall_thickness == 0
          errors.add(:myometrium_anterior_wall_thickness, "Значение не задано или недопустимо")
        end
        if myometrium_posterior_wall_thickness.nil? || myometrium_posterior_wall_thickness == 0
          errors.add(:myometrium_posterior_wall_thickness, "Значение не задано или недопустимо")
        end
      end
      
      # эндометрий
      if endometrium_echostructure_change.value == '-- не задано --'
        errors.add(:endometrium_echostructure_change_id, "Не задано значение")
      end
      if endometrium_echostructure_change.value == 'изменена' && endometrium_echostructure_change_type.value == '-- не задано --'
        errors.add(:endometrium_echostructure_change_type_id, "Не задано значение")
      end
      if endometrium_phase.value == '-- не задано --'
        errors.add(:endometrium_phase_id, "Не задано значение")
      end
      if endometrial_boundary.value == '-- не задано --'
        errors.add(:endometrial_boundary_id, "Не задано значение")
      end
      if endometrial_adumbration.value == '-- не задано --'
        errors.add(:endometrial_adumbration_id, "Не задано значение")
      end
      if endometrial_thickness.nil? || endometrial_thickness == 0
        errors.add(:endometrial_thickness, "Не задано значение")
      end
      
      # полость матки
      if uterine_cavity_deformation.value == '-- не задано --'
        errors.add(:uterine_cavity_deformation_id, "Не задано значение")
      end
      if uterine_cavity_size_change.value == '-- не задано --'
        errors.add(:uterine_cavity_size_change_id, "Не задано значение")
      end

      # шейка
      if cervix_visibility.value == 'определяется' 
        if cervix_size.nil? || cervix_size == 0
          errors.add(:cervix_size, "Значение не задано или недопустимо")
        end
        if cervix_structure_change.value == '-- не задано --'
          errors.add(:cervix_structure_change_id, "Не задано значение")
        end
        if cervix_structure_change.value == 'изменена'
          if (endocervix_cyst_min_size.nil? || endocervix_cyst_min_size == 0 ) && 
             (endocervix_cyst_max_size.nil? || endocervix_cyst_max_size == 0 )
            errors.add(:endocervix_cyst_min_size, "Значение не задано или недопустимо")
            errors.add(:endocervix_cyst_max_size, "Значение не задано или недопустимо")
          end
          if (!endocervix_cyst_min_size.nil? && !endocervix_cyst_max_size.nil? )
            if endocervix_cyst_min_size > endocervix_cyst_max_size
              errors.add(:endocervix_cyst_min_size, "Минимальный размер не может превышать максимальный")
              errors.add(:endocervix_cyst_max_size, "Минимальный размер не может превышать максимальный")
            end
          end
        end
      end
    end
  end
end

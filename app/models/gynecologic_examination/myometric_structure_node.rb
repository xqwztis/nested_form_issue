# encoding: UTF-8
class GynecologicExamination::MyometricStructureNode < ActiveRecord::Base
  belongs_to :gynecologic_examination
  belongs_to :depth_localization
  belongs_to :localization

  attr_accessible :gynecologic_examination_id
  attr_accessible :localization, :localization_id
  attr_accessible :depth_localization, :depth_localization_id
  attr_accessible :size
  attr_accessible :comment
  
  validate :check_attributes_presence
  
  def check_attributes_presence
    if size.nil? || size == 0
      errors.add(:size, "Значение не задано или недопустимо")
    end
  end
end

# encoding: UTF-8
class GynecologicExamination < ActiveRecord::Base
  belongs_to :left_ovary, :class_name => 'GynecologicExamination::Ovary', :dependent => :destroy
  belongs_to :right_ovary, :class_name => 'GynecologicExamination::Ovary', :dependent => :destroy
  belongs_to :ovaries
  accepts_nested_attributes_for :left_ovary, :allow_destroy => true
  accepts_nested_attributes_for :right_ovary, :allow_destroy => true
  attr_accessible :uterine_length
  attr_accessible :left_ovary_id, :left_ovary
  attr_accessible :right_ovary_id, :right_ovary
  attr_accessible :left_ovary_attributes
  attr_accessible :right_ovary_attributes
end

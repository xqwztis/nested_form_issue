# encoding: UTF-8
class GynecologicExamination::Ovary < ActiveRecord::Base
  has_one :gynecologic_examination
  has_many :formations, :class_name => 'GynecologicExamination::Ovary::Formation', :dependent => :destroy
  accepts_nested_attributes_for :formations, :allow_destroy => true
  attr_accessible :length
  attr_accessible :thickness
  attr_accessible :width
  attr_accessible :follicle_attributes
  attr_accessible :formations_attributes
end
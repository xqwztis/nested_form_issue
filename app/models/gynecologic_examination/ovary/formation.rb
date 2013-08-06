class GynecologicExamination::Ovary::Formation < ActiveRecord::Base
  belongs_to :ovary
  has_many :chambers, :class_name => 'GynecologicExamination::Ovary::Formation::Chamber', :dependent => :destroy
  accepts_nested_attributes_for :chambers, :allow_destroy => true
  attr_accessible :size
  attr_accessible :chambers_attributes
end

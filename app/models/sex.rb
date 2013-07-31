class Sex < ActiveRecord::Base
  has_many :patients
  attr_accessible :value
end

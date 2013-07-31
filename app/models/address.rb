class Address < ActiveRecord::Base
  has_one :patient
  attr_accessible :appartment, :city, :house, :street
end

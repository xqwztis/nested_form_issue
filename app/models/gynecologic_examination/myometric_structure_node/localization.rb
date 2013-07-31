class GynecologicExamination::MyometricStructureNode::Localization < ActiveRecord::Base
  has_many :myometric_structure_nodes
  attr_accessible :value
end

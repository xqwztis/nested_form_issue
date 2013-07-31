class GynecologicExamination::MyometricStructureNode::DepthLocalization < ActiveRecord::Base
  has_many :myometric_structure_nodes
  attr_accessible :value
end

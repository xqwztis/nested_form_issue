class GynecologicExamination::EndometriumEchostructureHyperechoicInclusion::Localization < ActiveRecord::Base
  has_many :endometrium_echostructure_hyperechoic_inclusions
  attr_accessible :value
end

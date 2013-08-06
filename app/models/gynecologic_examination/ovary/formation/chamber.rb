class GynecologicExamination::Ovary::Formation::Chamber < ActiveRecord::Base
  belongs_to :formation
  attr_accessible :size
end

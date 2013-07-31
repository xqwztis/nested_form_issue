class PatientExamination < ActiveRecord::Base
  belongs_to :patient
  belongs_to :gynecologic_examination
  attr_accessible :patient_id, :gynecologic_examination_id
  
  def examination_type
    [:gynecologic_examination].each do |exam|
      return exam unless self.send((exam.to_s + "_id").to_sym).nil?
    end
  end

  def examination
    self.send(examination_type)
  end
end

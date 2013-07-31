# -*- encoding: utf-8 -*-
class Patient < ActiveRecord::Base
  belongs_to :sex
  belongs_to :address, :dependent => :destroy
  has_many :patient_examinations
  has_many :gynecologic_examinations, :through => :patient_examinations
  accepts_nested_attributes_for :address, :allow_destroy => true
  attr_accessible :dob, :first_name, :last_name, :patronymic, :phone
  attr_accessible :sex_id, :sex
  attr_accessible :address_id, :address
  attr_accessible :address_attributes
  validates :last_name, :first_name, :patronymic, :dob, :sex_id, :presence => true
  validates_uniqueness_of :last_name, :scope => [:first_name, :patronymic, :dob], :message => 'Пациент с такими данными уже есть в базе'
  validate :dob_check
  validate :phone_format

  def dob_check
    today = Date.today
    unless dob.nil?
      if today - 113.years < dob and dob < today
        return true
      else
        errors.add(:dob, "Дата рождения вне диапазона: #{today - 113.years} - #{today}")
        return false
      end
    end
  end

  def phone_format
    return true if phone.nil? || phone.empty?
    value = phone.gsub(/\s|-|\(|\)/,'') # удалить пробелы, тире, скобки
    errors.add(:phone, "неверный формат данных: #{phone}") unless value =~ /^((\+7|8)\d{10}|^((\+7|8)8332)?\d{6})/
  end
end

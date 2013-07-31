module ApplicationHelper
  def age(dob)
    now = Date.today
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
  
  def format_name(person)
    [person.last_name, person.first_name, person.patronymic].join(' ')
  end
end

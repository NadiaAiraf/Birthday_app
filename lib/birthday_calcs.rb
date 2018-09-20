require 'date'

class BirthdayCalcs
  attr_reader :name, :dob
  def initialize(name,dob)
    @name = name
    @dob = dob
  end

  def days_to_birthday
    ((Date.parse(dob) - Date.today) % 365).to_i
  end

  def birthday_today?
    (Date.parse(dob) - Date.today) % 365 == 0
  end

  def multiple_days
    days_to_birthday == 1 ? '' : 's'
  end
end

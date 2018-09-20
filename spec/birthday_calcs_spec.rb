require 'birthday_calcs'
require 'date'

describe BirthdayCalcs do
  let(:mybirthday) { described_class.new('aidan','1992-03-15') }

  describe '#name' do
    it 'allows the name to be returned' do
      expect(mybirthday.name).to eq 'Aidan'
    end
  end

  describe '#dob' do
    it 'allows the date of birth to be returned' do
      expect(mybirthday.dob).to eq '1992-03-15'
    end
  end

  describe '#days_to_birthday' do
    it 'returns the number of days you have until your birthday' do
      allow(Date).to receive(:today).and_return Date.new(1992,3,5)
      expect(mybirthday.days_to_birthday).to eq 10
    end
    it 'returns the number of days you have until your birthday' do
      allow(Date).to receive(:today).and_return Date.new(1992,3,15)
      expect(mybirthday.days_to_birthday).to eq 0
    end
  end

  describe '#birthday_today?' do
    it 'returns the number of days you have until your birthday' do
      allow(Date).to receive(:today).and_return Date.new(1992,3,5)
      expect(mybirthday.birthday_today?).to eq false
    end
    it 'returns the number of days you have until your birthday' do
      allow(Date).to receive(:today).and_return Date.new(1992,3,15)
      expect(mybirthday.birthday_today?).to eq true
    end
  end
end

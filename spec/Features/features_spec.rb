require 'spec_helper'

describe Birthday do
  feature 'it allows you to visit the homepage' do
    scenario 'you go to the homepage' do
      visit('/')
      expect(page).to have_content('Hello there!')
    end
  end

  feature 'it allows you to enter your name and birthday' do
    scenario 'you enter name and date of birth' do
      visit('/')
      fill_in 'fname', with: 'aidan'
      fill_in "bdate", with: "2014/01/01"
      click_button 'Submit'
      expect(page).to have_content('Hello aidan, you have')
      expect(page).to have_content('days until your birthday')
    end

    scenario 'you enter name and date of birth' do
      allow(Date).to receive(:today).and_return Date.new(2001,2,3)
      visit('/')
      fill_in 'fname', with: 'aidan'
      fill_in "bdate", with: "2001/02/03"
      click_button 'Submit'
      expect(page).to have_content('HAPPY BIRTHDAY AIDAN')
    end
  end
end

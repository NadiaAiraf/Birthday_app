require 'spec_helper'

describe Birthday do
  feature 'it allows you to visit the homepage' do
    scenario 'you go to the homepage' do
      visit('/')
      expect(page).to have_content('Hello there!')
    end

    scenario 'it doesnt change page if you dont enter a birth date ' do
      visit('/')
      fill_in "fname", with: "aidan"
      click_button 'Submit'
      expect(page).to have_content 'Please enter the date of your NEXT birthday'
    end
  end

  feature 'takes you to a page saying it isnt your birthday' do
    scenario 'you enter name and date of birth' do
      allow(Date).to receive(:today).and_return Date.new(2001,2,3)
      visit_home_enter_name
      fill_in "bdate", with: "2001/02/06"
      click_button 'Submit'
      expect(page).to have_content('Hello Aidan, you have 3 days until your birthday')
    end

    scenario 'you enter name and date of birth' do
      allow(Date).to receive(:today).and_return Date.new(2001,2,5)
      visit_home_enter_name
      fill_in "bdate", with: "2001/02/06"
      click_button 'Submit'
      expect(page).to have_content('Hello Aidan, you have 1 day until your birthday')
    end
  end

  feature 'it takes you to a page saying happy birthday if it is your birthday' do
    scenario 'you enter name and date of birth' do
      allow(Date).to receive(:today).and_return Date.new(2001,2,3)
      visit_home_enter_name
      fill_in "bdate", with: "2001/02/03"
      click_button 'Submit'
      expect(page).to have_content('HAPPY BIRTHDAY AIDAN')
    end
  end
end

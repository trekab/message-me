require 'rails_helper'
 
RSpec.describe 'Creating a user', type: :feature do
  scenario 'valid inputs' do
    visit signup_path
    fill_in 'First Name', with: 'John'
    fill_in 'Last Name', with: 'Doe'
    fill_in 'Email', with: 'johndoe@ymail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_on 'Submit'
    expect(page).to have_content('Welcome to the MessageMe App!')
  end

  scenario 'invalid inputs' do
    visit signup_path
    fill_in 'First Name', with: ''
    fill_in 'Last Name', with: 'Doe'
    fill_in 'Email', with: 'johndoe@ymail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_on 'Submit'
    expect(page).to have_content("First name can't be blank")
  end
end
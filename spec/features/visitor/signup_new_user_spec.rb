require 'rails_helper'

feature "Add New Users", :type => :feature do
  it 'test user signup process' do
    visit new_user_registration_path
    expect(page).to have_content('Sign up')
    fill_in "user_username", with: "Faker"
    fill_in "user_email", with: "faker@gmail.com"
    fill_in "user_password", with: "123456789"
    fill_in "user_password_confirmation", with: "123456789"
    click_button "Sign up"
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end

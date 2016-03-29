require 'rails_helper'

feature "login registered user" do
  let(:user) { create(:user) }

  it 'testing login user process' do
    visit new_user_session_path
    expect(page).to have_content('Sign in')
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_button "Sign in"
    expect(page).to have_content('Signed in successfully.')
  end
end

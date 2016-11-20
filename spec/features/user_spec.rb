require 'rails_helper'

#support in /support/login_macros.rb

feature 'User management' do
  let!(:user){create(:user)}

  background do
    # sign_in user
  end

  scenario 'logs in user' do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button("Log in")
    expect(page).to have_content('Queries')
  end

  scenario 'signs out user' do
    # click_link "Sign out"
    #
    # expect(page).to have_content('Please login')
  end
end

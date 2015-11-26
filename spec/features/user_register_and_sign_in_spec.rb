require 'spec_helper'

feature "User can sign in after registration " do
  scenario "guest creates an account" do
    visit root_path
    click_link 'Sign Up Now!'

    fill_in 'Email Address', with: 'sam@example.com'
    fill_in 'Password', with: 'passwords'
    fill_in 'Full Name', with: 'Sam Peterson'
    click_button 'Sign Up'

    expect(page).to have_content('Sign in')

    fill_in 'Email Address', with: 'sam@example.com'
    fill_in 'Password', with: 'passwords'
    click_button 'Sign in'

    expect(current_path).to eq(home_path) 
  end
end
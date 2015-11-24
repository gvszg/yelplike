require 'spec_helper'

feature "User can add a business" do
  given!(:cafe) { Fabricate(:category, name: 'Coffee & Tea') }
  given!(:joe) { Fabricate(:user) }

  scenario "user creates a new business" do
    sign_in
    visit home_path
    click_link "My Yelp"
    visit my_yelp_path
    click_link "Add New Business"

    fill_in 'Name', with: 'Coffee Sweet'
    fill_in 'Address', with: '1F., No.3, Aly. 20, Ln. 33, Sec. 1, Zhongshan N. Rd., Zhongshan Dist.'
    fill_in 'Region', with: 'Taipei City'
    fill_in 'Country', with: 'Taiwan'
    select('Coffee & Tea', :from => 'Category')
    click_button 'Create Business'

    expect(page).to have_content('Coffee Sweet')
  end
end
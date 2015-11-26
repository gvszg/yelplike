require 'spec_helper'

feature "User can submit a new review for a business" do
  scenario "user creates a new review for a bsiness" do
    food = Fabricate(:category, name: 'Food')
    pasta = Fabricate(:business, category: food)
    alice = Fabricate(:user)
    sign_in
    visit home_path    
    expect(page).to have_content(pasta.name)

    find("a[href='/businesses/#{pasta.id}']").click
    choose '2'
    fill_in 'Write Your Review', with: "I don't like it!"
    click_button 'Submit'

    expect(page).to have_content("I don't like it!")
  end
end
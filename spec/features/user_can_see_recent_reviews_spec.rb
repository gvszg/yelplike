require 'spec_helper'

feature "User can see a list of recent reviews" do
  given(:cafe) { Fabricate(:category, name: 'cafe') }
  given(:joe) { Fabricate(:user) }
  given(:alice) { Fabricate(:user) }
  given(:kohimomento) { Fabricate(:business, name: 'Kohimomento', creator: joe, category: cafe) }
  given(:mojo) { Fabricate(:business, name: 'Mojocoffee', creator: joe, category: cafe) }

  background do
    review1 = Fabricate(:review, creator: joe, business: kohimomento)
    review2 = Fabricate(:review, creator: alice, business: mojo)
    review3 = Fabricate(:review, creator: joe, business: mojo)
    sign_in
    visit reviews_path
  end

  scenario "user sees all reviews" do    
    click_link "Reviews"
    expect(page).to have_content(joe.full_name)
    expect(page).to have_content(kohimomento.name)
    expect(page).to have_content(alice.full_name)
    expect(page).to have_content(mojo.name)
  end

  scenario "user can see another user's profile page" do
    first("a[href='/users/#{joe.id}']").click
    expect(page).to have_content(joe.full_name)
    expect(page).to have_content(kohimomento.name)
    expect(page).to have_content(mojo.name)
  end
end
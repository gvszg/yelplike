require 'spec_helper'

feature "User can see a list of recent reviews" do
  scenario "user sees all reviews" do
    cafe = Fabricate(:category, name: 'cafe')
    joe = Fabricate(:user)
    kohimomento = Fabricate(:business, name: 'Kohimomento', creator: joe, category: cafe)
    mojo = Fabricate(:business, name: 'Mojocoffee', creator: joe, category: cafe)
    
    review1 = Fabricate(:review, creator: joe, business: kohimomento)
    review2 = Fabricate(:review, creator: joe, business: mojo)

    sign_in

    visit reviews_path
    click_link "Reviews"

    expect(page).to have_content(kohimomento.name)
  end
end
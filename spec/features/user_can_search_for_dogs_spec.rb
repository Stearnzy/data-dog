require 'rails_helper'

describe "User can search for dogs" do
  it "and can see results on the page" do
    visit root_path
    fill_in :number,	with: "5"
    click_button "Fetch Dogs"

    expect(current_path).to eq(search_path)
    expect(page).to have_content('5 Results')

    within '.dog' do
      expect(page).to have_css('.image')
      expect(page).to have_css('.breed')
      expect(page).to have_css('.life-span')
      expect(page).to have_css('.temperament')
    end
  end
  
end

# As a user,
# When I visit the "/"
# And I enter "5" into the number field
# And I click on "Fetch Dogs"
# Then my path should be "/search"
# And I should see a message "5 Results"
# And I should see the following information for each result:
#   - image
#   - breed name
#   - life span
#   - temperament

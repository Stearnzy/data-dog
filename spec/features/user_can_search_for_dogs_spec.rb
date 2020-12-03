require 'rails_helper'

describe "User can search for dogs" do
  it "and can see results on the page" do

    # json_response = File.read("spec/fixtures/dog_search.json")

    # stub_request(:get, "https://api.thedogapi.com/v1/images/search?limit=5").
    #      with(
    #        headers: {
    #    	  'X-Api-Key'=>'INSERT API KEY HERE'
    #        }).
    #      to_return(status: 200, body: json_response, headers: {})

    VCR.use_cassette('dog_search') do
      visit root_path
      fill_in :number,	with: "5"
      click_button "Fetch Dogs"
  
      expect(current_path).to eq(search_path)
      expect(page).to have_content('5 Results')
  
      within(first('.dog')) do
        expect(page).to have_css('.image')
        expect(page).to have_css('.breed')
        expect(page).to have_css('.life-span')
        expect(page).to have_css('.temperament')
      end
    end
  end
end

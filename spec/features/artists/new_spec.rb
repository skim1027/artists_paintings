require 'rails_helper'

RSpec.describe 'creating new artist', type: :feature do
  before :each do
    @artist_1 = Artist.create!(name: "Leonardo da Vinci", year_born: 1452, country: 'Italy', alive: false)
    @artist_2 = Artist.create!(name: "Edgar Degas", year_born: 1834, country: 'France', alive: false)
    @artist_3 = Artist.create!(name: "Yayoi Kusama", year_born: 1929, country: 'Japan', alive: true)
    @artist_4 = Artist.create!(name: "Beatrice Modisett", year_born: 1985, country: 'US', alive: true)
  end

  describe 'as a user' do
    describe 'the Artist creation' do
      it 'allows you to click the link' do
        # When I click this link
        # Then I am taken to '/parents/new' where I  see a form for a new parent record
        visit "/artists"
        click_link("New Artist")

        expect(current_path).to eq("/artists/new")
      end

      it 'Create Artist and return to /artists' do
        # When I fill out the form with a new parent's attributes:
        # And I click the button "Create Parent" to submit the form
        visit "/artists/new"
        fill_in("Name", with: "Paul Klee")
        fill_in("Year born", with: 1879)
        fill_in("Country", with: "Germany")
        fill_in("Alive", with: false)
        click_button("Create Artist")

        expect(current_path).to eq("/artists")
        expect(page).to have_content("Paul Klee")
      end
    end
  end
end

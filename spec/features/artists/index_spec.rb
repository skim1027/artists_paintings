require 'rails_helper'

RSpec.describe 'artists index page', type: :feature do
  before :each do
    @artist_1 = Artist.create!(name: "Leonardo da Vinci", year_born: 1452, country: 'Italy', alive: false)
    @artist_2 = Artist.create!(name: "Edgar Degas", year_born: 1834, country: 'France', alive: false)
    @artist_3 = Artist.create!(name: "Yayoi Kusama", year_born: 1929, country: 'Japan', alive: true)
    @artist_4 = Artist.create!(name: "Beatrice Modisett", year_born: 1985, country: 'US', alive: true)
  end
  
  describe 'as a user' do
    describe 'when I visit /artists' do
      it 'shows name of each artist record in the system' do
        # For each parent table
        # As a visitor
        # When I visit '/parents'
        # Then I see the name of each parent record in the system
        
        visit "/artists"
        save_and_open_page
        expect(page).to have_content("All Artists")
        expect(page).to have_content(@artist_1.name)
        expect(page).to have_content(@artist_2.name)
        expect(page).to have_content(@artist_3.name)
        expect(page).to have_content(@artist_4.name)
      end
    end
  end
end
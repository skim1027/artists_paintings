require 'rails_helper'

RSpec.describe 'artists index page', type: :feature do
  describe 'as a user' do
    describe 'when I visit /artists' do
      it 'shows name of each artist record in the system' do
        # For each parent table
        # As a visitor
        # When I visit '/parents'
        # Then I see the name of each parent record in the system
        artist_1 = Artist.create!(name: "Leonardo da Vinci", year_born: 1452, country: 'Italy', alive: false)
        
        visit "/artists"
        save_and_open_page
        expect(page).to have_content(artist_1.name)
      end
    end
  end
end
require 'rails_helper'

RSpec.describe 'artists index page', type: :feature do
  before :each do
    @artist_1 = Artist.create!(name: "Leonardo da Vinci", year_born: 1452, country: 'Italy', alive: false)
    @artist_2 = Artist.create!(name: "Edgar Degas", year_born: 1834, country: 'France', alive: false)
    @painting_1 = @artist_1.paintings.create!(name: "Mona Lisa", year_painted: 1516, oil_painting: true)
    @painting_2 = @artist_1.paintings.create!(name: "The Last Supper", year_painted: 1498, oil_painting: false)
    @painting_3 = @artist_2.paintings.create!(name: "La Toilette", year_painted: 1886, oil_painting: false)
  end
  describe 'as a user' do
    describe 'when I visit /artists/:artist_id/paintings' do
      it 'shows paintings belonging to the artist' do
        # As a visitor
        # When I visit '/parents/:parent_id/child_table_name'
        # Then I see each Child that is associated with that Parent with each Child's attributes
        # (data from each column that is on the child table)
        
        visit "/artists/#{@artist_1.id}/paintings"
        save_and_open_page
        expect(page).to have_content(@painting_1.name)
        expect(page).to have_content(@painting_1.year_painted)
        expect(page).to have_content(@painting_1.oil_painting)
        expect(page).to have_content(@painting_2.name)
        expect(page).to have_content(@painting_2.year_painted)
        expect(page).to have_content(@painting_2.oil_painting)
        expect(page).to_not have_content(@painting_3.name)
      end
    end
  end
end 
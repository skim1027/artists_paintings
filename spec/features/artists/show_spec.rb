require 'rails_helper'

RSpec.describe 'artist show page', type: :feature do
  before :each do
    @artist_1 = Artist.create!(name: "Leonardo da Vinci", year_born: 1452, country: 'Italy', alive: false)
    @artist_2 = Artist.create!(name: "Edgar Degas", year_born: 1834, country: 'France', alive: false)
    @artist_3 = Artist.create!(name: "Yayoi Kusama", year_born: 1929, country: 'Japan', alive: true)
    @artist_4 = Artist.create!(name: "Beatrice Modisett", year_born: 1985, country: 'US', alive: true)
    @painting_1 = @artist_1.paintings.create!(name: "Mona Lisa", year_painted: 1516, oil_painting: true)
    @painting_2 = @artist_1.paintings.create!(name: "The Last Supper", year_painted: 1498, oil_painting: false)
    @painting_3 = @artist_2.paintings.create!(name: "La Toilette", year_painted: 1886, oil_painting: false)
  end


  describe 'as a user' do
    describe 'when I visit /artists/:id' do
      it 'shows the name of artist with that id including the attributes' do
        # As a visitor
        # When I visit '/parents/:id'
        # Then I see the parent with that id including the parent's attributes
        # (data from each column that is on the parent table)
        visit "/artists/#{@artist_1.id}"
        expect(page).to have_content(@artist_1.name)
        expect(page).to have_content(@artist_1.year_born)
        expect(page).to have_content(@artist_1.country)
        expect(page).to have_content(@artist_1.alive)
        expect(page).to_not have_content(@artist_2.name)
      end

      it 'shows the number of paintings associated with the artist' do
        # As a visitor
        # When I visit a parent's show page
        # I see a count of the number of children associated with this parent
        visit "/artists/#{@artist_1.id}"
        expect(@artist_1.number_of_paintings).to eq(2)
        expect(page).to have_content("Number of paintings for Leonardo da Vinci: 2")
      end
    end
  end
end
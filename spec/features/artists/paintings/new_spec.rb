require 'rails_helper'

RSpec.describe 'paintings new creation', type: :feature do
  before :each do
    @artist_1 = Artist.create!(name: "Leonardo da Vinci", year_born: 1452, country: 'Italy', alive: false)
    @artist_2 = Artist.create!(name: "Edgar Degas", year_born: 1834, country: 'France', alive: false)
    @artist_3 = Artist.create!(name: "Yayoi Kusama", year_born: 1929, country: 'Japan', alive: true)
    @artist_4 = Artist.create!(name: "Beatrice Modisett", year_born: 1985, country: 'US', alive: true)
    @painting_1 = @artist_1.paintings.create!(name: "Mona Lisa", year_painted: 1516, oil_painting: true)
    @painting_2 = @artist_1.paintings.create!(name: "The Last Supper", year_painted: 1498, oil_painting: false)
    @painting_3 = @artist_2.paintings.create!(name: "La Toilette", year_painted: 1886, oil_painting: false)
    @painting_4 = @artist_2.paintings.create!(name: "Blue Dancers", year_painted: 1884, oil_painting: true)
    @painting_5 = @artist_3.paintings.create!(name: "Flowers", year_painted: 1991, oil_painting: false)
    @painting_6 = @artist_4.paintings.create!(name: "Deep in the Water", year_painted: 2018, oil_painting: true)
  end

  describe 'as a user' do
    describe 'when I visit /artists/:artist_id/paintings' do
      it 'allows you to click on the link' do
        # When I visit a Parent Children Index page
        # Then I see a link to add a new adoptable child for that parent "Create Child" When I click the link I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child

        visit "/artists/#{@artist_1.id}/paintings"
        click_link("New Painting")

        expect(current_path).to eq("/artists/#{@artist_1.id}/paintings/new")
        expect(current_path).to_not eq("/artists/#{@artist_1.id}/paintings")
      end

      it 'creates Painting and returns to /artists/:artist_id/paintings' do
        visit "/artists/#{@artist_1.id}/paintings/new"
        fill_in("Name", with: "Lady with an Ermine")
        fill_in("Year painted", with: 1491)
        fill_in("Oil painting", with: true)
        click_button("Create Painting")
        expect(current_path).to eq("/artists/#{@artist_1.id}/paintings")
        expect(page).to have_content("Lady with an Ermine")
        save_and_open_page
      end
    end
  end
end

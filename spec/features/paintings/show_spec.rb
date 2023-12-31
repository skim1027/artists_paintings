require 'rails_helper'

RSpec.describe 'paintings index page', type: :feature do
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
    describe 'when I visit /paintings/:painting_id' do
      it 'shows the paintings with that ID an attributes' do
        # As a visitor
        # When I visit '/child_table_name/:id'
        # Then I see the child with that id including the child's attributes
        # (data from each column that is on the child table)

        visit "/paintings/#{@painting_1.id}"
        expect(page).to have_content(@painting_1.name)
        expect(page).to have_content(@painting_1.year_painted)
        expect(page).to have_content(@painting_1.oil_painting)
        expect(page).to_not have_content(@painting_2.name)
      end

      it 'shows the paintings index link' do
        # When I visit any page on the site
        # Then I see a link at the top of the page that takes me to the Child Index

        visit "/paintings/#{@painting_1.id}"
        expect(page).to have_link("Paintings")
        expect("Paintings").to appear_before("Painting Info")
      end

      it 'shows the artists index link' do
        # When I visit any page on the site
        # Then I see a link at the top of the page that takes me to the Parent Index

        visit "/paintings/#{@painting_1.id}"
        expect(page).to have_link("Artists")
        expect("Artists").to appear_before("Painting Info")
      end
    end
  end

end
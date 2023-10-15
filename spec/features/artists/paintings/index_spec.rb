require 'rails_helper'

RSpec.describe 'artists index page', type: :feature do
  before :each do
    @artist_1 = Artist.create!(name: "Leonardo da Vinci", year_born: 1452, country: 'Italy', alive: false)
    @artist_2 = Artist.create!(name: "Edgar Degas", year_born: 1834, country: 'France', alive: false)
    @painting_1 = @artist_1.paintings.create!(name: "Mona Lisa", year_painted: 1516, oil_painting: true)
    @painting_2 = @artist_1.paintings.create!(name: "The Last Supper", year_painted: 1498, oil_painting: false)
    @painting_4 = @artist_2.paintings.create!(name: "La Toilette", year_painted: 1886, oil_painting: false)
    @painting_5= @artist_2.paintings.create!(name: "Blue Dancers", year_painted: 1897, oil_painting: false)
    @painting_6= @artist_2.paintings.create!(name: "Mary Cassatt Seated, Holding Cards", year_painted: 1884, oil_painting: true)
  end
  
  describe 'as a user' do
    describe 'when I visit /artists/:artist_id/paintings' do
      it 'shows paintings belonging to the artist' do
        # As a visitor
        # When I visit '/parents/:parent_id/child_table_name'
        # Then I see each Child that is associated with that Parent with each Child's attributes
        # (data from each column that is on the child table)
        
        visit "/artists/#{@artist_1.id}/paintings"
        expect(page).to have_content(@painting_1.name)
        expect(page).to have_content(@painting_1.year_painted)
        expect(page).to have_content(@painting_1.oil_painting)
        expect(page).to have_content(@painting_2.name)
        expect(page).to have_content(@painting_2.year_painted)
        expect(page).to have_content(@painting_2.oil_painting)
        expect(page).to_not have_content(@painting_4.name)
      end

      it 'shows the paintings index link' do
        # When I visit any page on the site
        # Then I see a link at the top of the page that takes me to the Child Index

        visit "/artists/#{@artist_1.id}/paintings"
        expect(page).to have_link("Paintings")
        expect("Paintings").to appear_before("Artist's Paintings")
      end

      it 'shows the artists index link' do
        # When I visit any page on the site
        # Then I see a link at the top of the page that takes me to the Parent Index

        visit "/artists/#{@artist_1.id}/paintings"
        expect(page).to have_link("Artists")
        expect("Artists").to appear_before("Artist's Paintings")
      end

      it 'sorts the artist paintings in alphabetical order by name' do
        # When I visit the Parent's children Index Page
        # Then I see a link to sort children in alphabetical order
        # When I click on the link
        # I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order

        visit "/artists/#{@artist_2.id}/paintings"
        expect(@painting_4.name).to appear_before(@painting_5.name)
        expect(@painting_5.name).to appear_before(@painting_6.name)

        click_link("Sort by Name")

        expect(current_path).to eq("/artists/#{@artist_2.id}/paintings")
        expect(@painting_5.name).to appear_before(@painting_4.name)
        expect(@painting_4.name).to appear_before(@painting_6.name)
        expect(@painting_6.name).to_not appear_before(@painting_5.name)
      end
    end
  end
end 
require 'rails_helper'

RSpec.describe 'artists index page', type: :feature do
  before :each do
    @artist_1 = Artist.create!(name: "Leonardo da Vinci", year_born: 1452, country: 'Italy', alive: false)
    @artist_2 = Artist.create!(name: "Edgar Degas", year_born: 1834, country: 'France', alive: false)
    @artist_3 = Artist.create!(name: "Yayoi Kusama", year_born: 1929, country: 'Japan', alive: true)
    @artist_4 = Artist.create!(name: "Beatrice Modisett", year_born: 1985, country: 'US', alive: true)
    @painting_1 = @artist_1.paintings.create!(name: "Mona Lisa", year_painted: 1516, oil_painting: true)
    @painting_3 = @artist_1.paintings.create!(name: "Vitruvian Man", year_painted: 1490, oil_painting: false)
    @painting_5= @artist_2.paintings.create!(name: "Blue Dancers", year_painted: 1897, oil_painting: false)
    @painting_13 = @artist_3.paintings.create!(name: "Flowers", year_painted: 1991, oil_painting: false)
    @painting_14 = @artist_3.paintings.create!(name: "Pumpkin", year_painted: 1992, oil_painting: false)
    @painting_15 = @artist_3.paintings.create!(name: "Infinity-Nets", year_painted: 2017, oil_painting: false)
    @painting_16 = @artist_4.paintings.create!(name: "Pewter Clouds Being to Lighten", year_painted: 2022, oil_painting: false)
    @painting_17 = @artist_4.paintings.create!(name: "Every Ninth Wave II", year_painted: 2018, oil_painting: true)
  
  end
  
  describe 'as a user' do
    describe 'when I visit /artists' do
      it 'shows the name of each artist record in the system' do
        # For each parent table
        # As a visitor
        # When I visit '/parents'
        # Then I see the name of each parent record in the system
        
        visit "/artists"
        expect(page).to have_content("All Artists")
        expect(page).to have_content(@artist_1.name)
        expect(page).to have_content(@artist_2.name)
        expect(page).to have_content(@artist_3.name)
        expect(page).to have_content(@artist_4.name)

        # And next to each of the records I see when it was created
        
        expect(page).to have_content(@artist_1.created_at)
        expect(page).to have_content(@artist_2.created_at)
        expect(page).to have_content(@artist_3.created_at)
        expect(page).to have_content(@artist_4.created_at)
      end

      it 'shows artists ordered by recently created' do
        # As a visitor
        # When I visit the parent index,
        # I see that records are ordered by most recently created first
        
        visit "/artists"
        expect(@artist_4.name).to appear_before(@artist_3.name)
        expect(@artist_3.name).to appear_before(@artist_2.name)
        expect(@artist_2.name).to appear_before(@artist_1.name)
        expect(@artist_1.name).to_not appear_before(@artist_4.name)
      end

      it 'shows paintings index link' do
        # As a visitor
        # When I visit any page on the site
        # Then I see a link at the top of the page that takes me to the Child Index

        visit "/artists"
        expect(page).to have_link("Paintings")
        expect("Paintings").to appear_before("All Artists")
      end

      it 'shows the link to create New Artist' do
        # When I visit the Parent Index page
        # Then I see a link to create a new Parent record, "New Parent"

        visit "/artists"
        expect(page).to have_link("New Artist")
      end

      it 'shows the link to each artist and take you to the artist' do
        visit "/artists"
        expect(page).to have_link("Leonardo da Vinci")
        click_link("Leonardo da Vinci")
        expect(current_path).to eq("/artists/#{@artist_1.id}")
      end

      it 'shows number of paintings' do
        visit "/artists"
        expect(page).to have_content("Number of Paintings")
      end

      it 'can sort artists by number of paintings' do
        visit "/artists"
        expect(@artist_4.name).to appear_before(@artist_3.name)
        
        click_link("Sort by # of Paintings")

        expect(current_path).to eq("/artists")
        expect(@artist_3.name).to appear_before(@artist_1.name)
        expect(@artist_1.name).to appear_before(@artist_2.name)
        expect(@artist_2.name).to_not appear_before(@artist_4.name)
      end
    end
  end
end
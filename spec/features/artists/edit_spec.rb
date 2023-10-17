require 'rails_helper'

RSpec.describe 'editing artist', type: :feature do
  before :each do
    @artist_1 = Artist.create!(name: "Leonardo da Vinci", year_born: 1452, country: 'Italy', alive: false)
    @artist_2 = Artist.create!(name: "Edgar Degas", year_born: 1834, country: 'France', alive: false)
    @artist_3 = Artist.create!(name: "Yayoi Kusama", year_born: 1929, country: 'Japan', alive: true)
    @artist_4 = Artist.create!(name: "Beatrice Modisett", year_born: 1985, country: 'US', alive: true)
    @artist_5 = Artist.create!(name: "Paul Kee", year_born: 1879, country: 'Germany', alive: true)
  end

  describe 'as a user' do
    describe 'the Artist edit' do
      it 'allows you to edit artist from index page' do
        visit "/artists"
        click_link("Edit #{@artist_1.name}")
        expect(current_path).to eq("/artists/#{@artist_1.id}/edit")
        expect(current_path).to_not eq("/artists")
      end
      
      it 'allows you to edit artist from specific artist page' do
        # When I click this link
        # Then I am taken to '/parents/new' where I  see a form for a new parent record
        visit "/artists/#{@artist_1.id}"
        click_link("Edit #{@artist_1.name}")
        expect(current_path).to eq("/artists/#{@artist_1.id}/edit")
        expect(current_path).to_not eq("/artists")
      end

      it 'Create Artist and return to /artists' do
        # When I fill out the form with a new parent's attributes:
        # And I click the button "Create Parent" to submit the form
        visit "/artists/#{@artist_5.id}" 
        expect(page).to have_content("Paul Kee")
        click_link("Edit Paul Kee")
        fill_in("Name", with: "Paul Klee")
        fill_in("Year born", with: 1879)
        fill_in("Country", with: "Germany")
        fill_in("Alive", with: false)
        click_button("Update Artist")
        
        expect(current_path).to eq("/artists")
        expect(current_path).to_not eq("/artists/new")
        expect(page).to have_content("Paul Klee")
      end

      it 'has links to /artist and /paintings' do
        visit "/artists/#{@artist_5.id}" 
        expect(page).to have_content("Edit Artist")
        expect(page).to have_link("Artists")
        expect(page).to have_link("Paintings")
      end
    end
  end
end

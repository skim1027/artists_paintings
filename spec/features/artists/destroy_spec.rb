require 'rails_helper'

RSpec.describe 'delete artist', type: :feature do
  before :each do
    @artist_1 = Artist.create!(name: "Leonardo da Vinci", year_born: 1452, country: 'Italy', alive: false)
    @artist_2 = Artist.create!(name: "Edgar Degas", year_born: 1834, country: 'France', alive: false)
    @artist_3 = Artist.create!(name: "Yayoi Kusama", year_born: 1929, country: 'Japan', alive: true)
    @artist_4 = Artist.create!(name: "Beatrice Modisett", year_born: 1985, country: 'US', alive: true)
    @artist_5 = Artist.create!(name: "Paul Kee", year_born: 1879, country: 'Germany', alive: true)
  end

  describe 'as a user' do
    describe 'the artist delete' do
      it 'allows you to delete artist from artist show page' do
        # As a visitor
        # When I visit a parent show page
        # Then I see a link to delete the parent
        # Then a 'DELETE' request is sent to '/parents/:id',
        # the parent is deleted, and all child records are deleted
        # and I am redirected to the parent index page where I no longer see this parent

        visit "/artists/#{@artist_1.id}"
        save_and_open_page
        click_link("Delete #{@artist_1.name}")
        expect(current_path).to eq("/artists")
        expect(current_path).to_not eq("/artists/#{@artist_1.id}")
        expect(page).to_not have_content("Leonardo da Vinci")
      end
      
    end
  end
end
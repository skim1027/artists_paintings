require 'rails_helper'

RSpec.describe 'delete paintings', type: :feature do
  before :each do
    @artist_1 = Artist.create!(name: "Leonardo da Vinci", year_born: 1452, country: 'Italy', alive: false)
    @artist_2 = Artist.create!(name: "Edgar Degas", year_born: 1834, country: 'France', alive: false)
    @painting_1 = @artist_1.paintings.create!(name: "Mona Lisa", year_painted: 1516, oil_painting: true)
    @painting_2 = @artist_1.paintings.create!(name: "The Last Supper", year_painted: 1498, oil_painting: false)
    @painting_3 = @artist_2.paintings.create!(name: "La Toilette", year_painted: 1886, oil_painting: false)
    @painting_4 = @artist_2.paintings.create!(name: "Blue Dancers", year_painted: 1884, oil_painting: true)

  end

  describe 'as a user' do
    describe 'the painting delete' do
      it 'allows you to delete painting from the show page' do
        # When I visit a child show page
        # Then I see a link to delete the child "Delete Child"
        # When I click the link
        # Then a 'DELETE' request is sent to '/child_table_name/:id',
        # the child is deleted,
        # and I am redirected to the child index page where I no longer see this child

        visit "/paintings/#{@painting_1.id}"
        click_link("Delete #{@painting_1.name}")
        expect(current_path).to eq("/paintings")
        expect(page).to_not have_content("Mona Lisa")
      end

      it 'allows you to delete paintings from the index page' do
        # As a visitor
        # When I visit the `child_table_name` index page or a parent `child_table_name` index page
        # Next to every child, I see a link to delete that child
        # When I click the link
        # I should be taken to the `child_table_name` index page where I no longer see that child

        visit "/paintings"
        click_link("Delete #{@painting_4.name}")
        expect(current_path).to eq("/paintings")
        expect(page).to_not have_content("Blue Dancers")
      end
    end
  end
end
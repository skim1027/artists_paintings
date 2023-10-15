require 'rails_helper'

RSpec.describe 'editing painting', type: :feature do
  before :each do
    @artist_1 = Artist.create!(name: "Leonardo da Vinci", year_born: 1452, country: 'Italy', alive: false)
    @painting_1 = @artist_1.paintings.create!(name: "Mona", year_painted: 1516, oil_painting: false)
    @painting_2 = @artist_1.paintings.create!(name: "The Last Supper", year_painted: 1498, oil_painting: false)
  end

  describe 'as a user' do
    describe 'the Painting edit' do
      it 'allows you to click the link' do
        # When I visit a Child Show page
        # Then I see a link to update that Child "Update Child"
        # When I click the link
        # I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:

        visit "/paintings/#{@painting_1.id}"
        click_button("Update #{@painting_1.name}")
        
        expect(current_path).to eq("/paintings/#{@painting_1.id}/edit")
      end

      it 'updates paintings and return to /paintings/:painting_id' do
        # When I click the button to submit the form "Update Child"
        # Then a `PATCH` request is sent to '/child_table_name/:id',
        # the child's data is updated,
        # and I am redirected to the Child Show page where I see the Child's updated information
        visit "/paintings/#{@painting_1.id}"
        expect(page).to have_content("Mona")
        click_button("Update Mona")
        
        fill_in("Name", with: "Mona Lisa" )
        fill_in("Year painted", with: 1491)
        fill_in("Oil painting", with: true)
        click_button("Update Painting")

        expect(current_path).to eq("/paintings/#{@painting_1.id}")
        expect(current_path).to_not eq("/paintings/#{@painting_1.id}/edit")
        expect(page).to have_content("Mona Lisa")
      end
    end
  end

end

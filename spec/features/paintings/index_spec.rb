require 'rails_helper'

RSpec.describe 'paintings index page', type: :feature do
  before :each do
    @painting_1 = Painting.create!(name: "Mona Lisa", year_painted: 1516, oil_painting: true)
    @painting_2 = Painting.create!(name: "The Last Supper", year_painted: 1498, oil_painting: false)
    @painting_3 = Painting.create!(name: "La Toilette", year_painted: 1886, oil_painting: false)
    @painting_4 = Painting.create!(name: "Blue Dancers", year_painted: 1884, oil_painting: true)
    @painting_5 = Painting.create!(name: "Flowers", year_painted: 1991, oil_painting: false)
    @painting_6 = Painting.create!(name: "Deep in the Water", year_painted: 2018, oil_painting: true)
  end

  describe 'as a user' do
    describe 'when I visit /paintings' do  
      it 'shows each painting in the systems with attributes' do
        # As a visitor
        # When I visit '/child_table_name'
        # Then I see each Child in the system including the Child's attributes
        # (data from each column that is on the child table)
        visit "/paintings"
        expect(page).to have_content("All Paintings")
        expect(page).to have_content(@painting_1.name)
        expect(page).to have_content(@painting_1.year_painted)
        expect(page).to have_content(@painting_1.oil_painting)
        expect(page).to have_content(@painting_2.name)
        expect(page).to have_content(@painting_2.year_painted)
        expect(page).to have_content(@painting_2.oil_painting)
        expect(page).to have_content(@painting_4.name)
        expect(page).to have_content(@painting_4.year_painted)
        expect(page).to have_content(@painting_4.oil_painting)
      end
    end

    describe 'when I visit /paintings/:id' do
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
    end
  end

end
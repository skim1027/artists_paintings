require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe 'association' do
    it { should have_many :paintings }
  end 

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:year_born) }
    it { should validate_presence_of(:country) }
    it { should allow_value(true).for(:alive) }
    it { should allow_value(false).for(:alive) }
  end

  before :each do
    @artist_1 = Artist.create!(name: "Leonardo da Vinci", year_born: 1452, country: 'Italy', alive: false)
    @painting_1 = @artist_1.paintings.create!(name: "Mona Lisa", year_painted: 1516, oil_painting: true)
    @painting_2 = @artist_1.paintings.create!(name: "The Last Supper", year_painted: 1498, oil_painting: false)
  end

  describe 'instance methods' do
    it 'returns the number of paintings' do
      expect(@artist_1.number_of_paintings).to eq(2)
    end

    it 'gives you sorted paintings' do
      expect(@artist_1.painting_sort).to eq([@painting_1, @painting_2])
    end

    it 'gives you search painting' do
      expect(@artist_1.painting_search(1500)).to eq([@painting_1])
    end

  end
end
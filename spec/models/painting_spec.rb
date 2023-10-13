require 'rails_helper'

RSpec.describe Painting, type: :model do
  describe 'association' do
    it { should belong_to :artist }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :year_painted }
    it { should allow_value(true).for(:oil_painting) }
    it { should allow_value(false).for(:oil_painting) }
  end
end
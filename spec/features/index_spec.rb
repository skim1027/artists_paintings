require 'rails_helper'

RSpec.describe 'Welcome', type: :feature do
  describe 'as a user' do
    describe 'visit /' do
      it 'shows link to artists and paintings' do
        visit '/'
        expect(page).to have_content("Welcome to Artists and Paintings")
        expect(page).to have_link("Artists")
        expect(page).to have_link("Paintings")
      end
    end
  end
end
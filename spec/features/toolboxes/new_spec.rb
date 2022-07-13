require 'rails_helper'

RSpec.describe 'New Toolbox' do
  describe 'As a visitor' do
    describe 'when I visit the toolboxes index page' do
      it 'then I see a link to create a new parent record' do
        visit '/toolboxes'

        click_link 'New Toolbox'

        expect(current_path).to eq('/toolboxes/new')
      end
    end
    describe 'when I fill out the form with a new parents attributes and submit the form' do
      it 'creates a new toolbox and redirects me to the toolbox index page where I see the new toolbox' do
        visit '/toolboxes/new'

        fill_in 'Name', with: 'Drills'
        fill_in 'Tool capacity', with: '4'
        fill_in 'Checked out?', with: 'false'
        click_on 'Create Toolbox'

        expect(current_path).to eq('/toolboxes')
        expect(page).to have_content('Drills')
      end
    end
  end
end
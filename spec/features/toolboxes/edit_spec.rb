require 'rails_helper'

RSpec.describe 'Toolbox Update' do
  describe 'As a visitor' do
    describe 'when i visit a toolbox show page' do
      it 'I see a link that will take me to a form to update the specified toolbox and will will let me fill a form to edit the toolbox attributes' do
        hammers = Toolbox.create!(name: "Hammers", tool_capacity: 5, checked_out: false)

        visit "/toolboxes/#{hammers.id}"

        click_link 'Update Toolbox'

        expect(current_path).to eq("/toolboxes/#{hammers.id}/edit")

        fill_in 'Name', with: 'Drills'
        fill_in 'Tool capacity', with: '4'
        fill_in 'Checked out', with: 'false'
        click_on 'Update Toolbox'

        expect(current_path).to eq("/toolboxes/#{hammers.id}")
        expect(page).to have_content('Drills')

        
      end

      # it  do
      #   hammers = Toolbox.create!(name: "Hammers", tool_capacity: 5, checked_out: false)

      #   visit "/toolboxes/#{hammers.id}/edit"

       
      
      # end
    end
  end
end
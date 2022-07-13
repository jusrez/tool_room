require 'rails_helper'

RSpec.describe 'Tool Update' do
  describe 'When i visit a Tool show page' do
    describe 'and I click Update Tool' do
      it 'takes me to a form to edit the tools attributes and returns me to the tool show page to see the updated information' do
        hammers = Toolbox.create!(name: "Hammers", tool_capacity: 5, checked_out: false)
        hand_hammer = Tool.create!(id: 1, name: "Hand Hammer", working_condition: true, quantity: 2, toolbox_id: hammers.id)

        visit "/tools/#{hand_hammer.id}"

        click_link 'Update Tool'

        expect(current_path).to eq("/tools/#{hand_hammer.id}/edit")

        fill_in 'Name', with: 'Mjolnir'
        fill_in 'working_condition', with: 'true'
        fill_in 'quantity', with: '1'
        fill_in 'toolbox_id', with: "#{hand_hammer.toolbox_id}"
        click_on 'Update Tool'

        expect(current_path).to eq("/tools/#{hand_hammer.id}")
        expect(page).to have_content('Mjolnir')
        
      end
    end
  end
end
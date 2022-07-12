require 'rails_helper'

RSpec.describe 'Toolboxes Show' do
  describe 'I visit a toolbox show page' do
    it 'then I see all of the attributes for that toolbox' do
      hammers = Toolbox.create!(name: "Hammers", tool_capacity: 5, checked_out: false)
      wrenches = Toolbox.create!(name: "Wrenches", tool_capacity: 11, checked_out: false)

      visit "/toolboxes/#{hammers.id}"

      expect(page).to have_content(hammers.name)
      expect(page).to have_content(hammers.tool_capacity)
      expect(page).to have_content(hammers.checked_out)
      expect(page).to_not have_content(wrenches.name)

    end

    it 'shows a count of the number of tools associated with this toolbox' do
      hammers = Toolbox.create!(name: "Hammers", tool_capacity: 5, checked_out: false)
      hand_hammer = Tool.create!(name: "Hand Hammer", working_condition: true, quantity: 2, toolbox_id: hammers.id)
      

      visit "toolboxes/#{hammers.id}"

      expect(page).to have_content("Tool Count")

    end
  end
end
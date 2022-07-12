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

    it 'will show a link at the top of the page that takes me to the tool index' do
      hammers = Toolbox.create!(name: "Hammers", tool_capacity: 5, checked_out: false)
      wrenches = Toolbox.create!(name: "Wrenches", tool_capacity: 11, checked_out: false)
      hand_hammer = Tool.create!(name: "Hand Hammer", working_condition: true, quantity: 2, toolbox_id: hammers.id)
      crescent_wrench = Tool.create!(name: "Crescent Wrench", working_condition: true, quantity: 1, toolbox_id: wrenches.id)
      box_wrench = Tool.create!(name: "Box Wrench", working_condition: true, quantity: 1, toolbox_id: wrenches.id)

      visit "/toolboxes/#{hammers.id}/tools"

      click_link 'All Tools'

      expect(current_path).to eq('/tools')

      visit "/toolboxes/#{wrenches.id}/tools"

      click_link 'All Tools'

      expect(current_path).to eq('/tools')
    end

    it 'will show a link at the top of the page that takes me to the toolbox index' do
      hammers = Toolbox.create!(name: "Hammers", tool_capacity: 5, checked_out: false)
      wrenches = Toolbox.create!(name: "Wrenches", tool_capacity: 11, checked_out: false)
      hand_hammer = Tool.create!(name: "Hand Hammer", working_condition: true, quantity: 2, toolbox_id: hammers.id)
      crescent_wrench = Tool.create!(name: "Crescent Wrench", working_condition: true, quantity: 1, toolbox_id: wrenches.id)
      box_wrench = Tool.create!(name: "Box Wrench", working_condition: true, quantity: 1, toolbox_id: wrenches.id)

      visit "/toolboxes/#{hammers.id}/tools"

      click_link 'All Toolboxes'

      expect(current_path).to eq('/toolboxes')

      visit "/toolboxes/#{wrenches.id}/tools"

      click_link 'All Toolboxes'

      expect(current_path).to eq('/toolboxes')
    end

    it 'will show a link at the top of the page that takes me to the tools page associated with that toolbox' do
      hammers = Toolbox.create!(name: "Hammers", tool_capacity: 5, checked_out: false)
      wrenches = Toolbox.create!(name: "Wrenches", tool_capacity: 11, checked_out: false)
      hand_hammer = Tool.create!(name: "Hand Hammer", working_condition: true, quantity: 2, toolbox_id: hammers.id)
      crescent_wrench = Tool.create!(name: "Crescent Wrench", working_condition: true, quantity: 1, toolbox_id: wrenches.id)
      box_wrench = Tool.create!(name: "Box Wrench", working_condition: true, quantity: 1, toolbox_id: wrenches.id)

      visit "/toolboxes/#{hammers.id}"

      click_link "Tools found in #{hammers.name} toolbox"

      expect(current_path).to eq("/toolboxes/#{hammers.id}/tools")
    end
  end
end
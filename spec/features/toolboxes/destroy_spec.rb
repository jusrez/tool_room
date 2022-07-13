require 'rails_helper'

RSpec.describe 'Toolbox Delete' do
  it 'when i visit a toolbox show page i will see a link to delete the toolbox' do
    hammers = Toolbox.create!(name: "Hammers", tool_capacity: 5, checked_out: false)
    hand_hammer = Tool.create!(name: "Hand Hammer", working_condition: false, quantity: 2, toolbox_id: hammers.id)
    
    visit "toolboxes/#{hammers.id}"

    click_link "Delete Toolbox"

    expect(current_path).to eq("/toolboxes")
    expect(page).to_not have_content("Hammers")
  end

  it 'when i visit the toolbox index page i will see a link to delete the parent' do
    hammers = Toolbox.create!(name: "Hammers", tool_capacity: 5, checked_out: false)
    hand_hammer = Tool.create!(name: "Hand Hammer", working_condition: false, quantity: 2, toolbox_id: hammers.id)

    visit '/toolboxes'

    click_link "Delete Toolbox"

    expect(current_path).to eq('/toolboxes')
    expect(page).to_not have_content("Hammers")
  end
end
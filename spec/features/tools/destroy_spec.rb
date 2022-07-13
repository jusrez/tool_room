require 'rails_helper'

RSpec.describe 'Tool Delete' do
  it 'when i visit a tool show page I see a link to delete the tool and when i click it i am redirected to the tools index' do
    wrenches = Toolbox.create!(name: "Wrenches", tool_capacity: 11, checked_out: false)
    crescent_wrench = Tool.create!(name: "Crescent Wrench", working_condition: false, quantity: 1, toolbox_id: wrenches.id)
    box_wrench = Tool.create!(name: "Box Wrench", working_condition: true, quantity: 1, toolbox_id: wrenches.id)

    visit "/tools/#{crescent_wrench.id}"

    click_link "Delete Tool"

    expect(current_path).to eq("/tools")
    expect(page).to_not have_content('Crescent Wrench')
    expect(page).to have_content('Box Wrench')
  end

  it 'when i visit the tools index page i will see a link to delete the tool' do
    hammers = Toolbox.create!(name: "Hammers", tool_capacity: 5, checked_out: false)
    hand_hammer = Tool.create!(name: "Hand Hammer", working_condition: true, quantity: 2, toolbox_id: hammers.id)
   

    visit '/tools'
    
    click_link "Delete Tool"

    expect(current_path).to eq('/tools')
    expect(page).to_not have_content("Hand Hammer")
  end

  it 'when i visit the toolbox tools index page i will see a link to delete the tool' do
    hammers = Toolbox.create!(name: "Hammers", tool_capacity: 5, checked_out: false)
    hand_hammer = Tool.create!(name: "Hand Hammer", working_condition: false, quantity: 2, toolbox_id: hammers.id)
    

    visit "toolboxes/#{hammers.id}/tools"

    click_link "Delete Tool"

    expect(current_path).to eq("/tools")
    expect(page).to_not have_content("Hand Hammer")

  end
end
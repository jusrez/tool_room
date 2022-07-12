require 'rails_helper'

RSpec.describe 'Toolbox Tools Index' do
  it 'will show the tools associated with the toolbox id as well as their attributes' do
    hammers = Toolbox.create!(name: "Hammers", tool_capacity: 5, checked_out: false)
    wrenches = Toolbox.create!(name: "Wrenches", tool_capacity: 11, checked_out: false)
    hand_hammer = Tool.create!(name: "Hand Hammer", working_condition: true, quantity: 2, toolbox_id: hammers.id)
    crescent_wrench = Tool.create!(name: "Crescent Wrench", working_condition: true, quantity: 1, toolbox_id: wrenches.id)
    box_wrench = Tool.create!(name: "Box Wrench", working_condition: true, quantity: 1, toolbox_id: wrenches.id)

    visit "/toolboxes/#{hammers.id}/tools"

    expect(page).to have_content(hand_hammer.name)
    expect(page).to have_content(hand_hammer.working_condition)
    expect(page).to have_content(hand_hammer.quantity)

    visit "/toolboxes/#{wrenches.id}/tools"

    expect(page).to have_content(crescent_wrench.name)
    expect(page).to have_content(crescent_wrench.working_condition)
    expect(page).to have_content(crescent_wrench.quantity)
    expect(page).to have_content(box_wrench.name)
    expect(page).to have_content(box_wrench.working_condition)
    expect(page).to have_content(box_wrench.quantity)
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
end
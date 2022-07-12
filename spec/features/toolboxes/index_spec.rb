require 'rails_helper'

RSpec.describe 'Toolboxes Index' do
  it 'shows the names of each toolbox' do
    hammers = Toolbox.create!(name: "Hammers", tool_capacity: 5, checked_out: false)
    wrenches = Toolbox.create!(name: "Wrenches", tool_capacity: 11, checked_out: false)

    visit '/toolboxes'

    expect(page).to have_content(hammers.name)
    expect(page).to have_content(wrenches.name)
  end

  it 'shows the name of each toolbox sorted by most recently created' do
    hammers = Toolbox.create!(name: "Hammers", tool_capacity: 5, checked_out: false)
    wrenches = Toolbox.create!(name: "Wrenches", tool_capacity: 11, checked_out: false)
    screwdrivers = Toolbox.create!(name: "Screwdrivers", tool_capacity: 7, checked_out:false)

    visit '/toolboxes'

    expect(page).to have_content(screwdrivers.created_at)
    expect(page).to have_content(wrenches.created_at)
    expect(page).to have_content(hammers.created_at)
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
end
require 'rails_helper'

RSpec.describe 'Tools Show' do
  it 'shows me the tool with the id specified including the tools attributes' do
    hammers = Toolbox.create!(name: "Hammers", tool_capacity: 5, checked_out: false)
    wrenches = Toolbox.create!(name: "Wrenches", tool_capacity: 11, checked_out: false)
    hand_hammer = Tool.create!(name: "Hand Hammer", working_condition: true, quantity: 2, toolbox_id: hammers.id)
    crescent_wrench = Tool.create!(name: "Crescent Wrench", working_condition: true, quantity: 1, toolbox_id: wrenches.id)

    visit "/tools/#{hand_hammer.id}"

    expect(page).to have_content(hand_hammer.name)
    expect(page).to have_content(hand_hammer.working_condition)
    expect(page).to have_content(hand_hammer.quantity)
    expect(page).to have_content(hand_hammer.toolbox_id)

    visit "/tools/#{crescent_wrench.id}"

    expect(page).to have_content(crescent_wrench.name)
    expect(page).to have_content(crescent_wrench.working_condition)
    expect(page).to have_content(crescent_wrench.quantity)
    expect(page).to have_content(crescent_wrench.toolbox_id)


  end
end
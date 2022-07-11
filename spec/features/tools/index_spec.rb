require 'rails_helper'

RSpec.describe 'Tools Index' do
  it 'shows me each tool in the system and the tools attributes' do
    hammers = Toolbox.create!(name: "Hammers", tool_capacity: 5, checked_out: false, id: 1)
    wrenches = Toolbox.create!(name: "Wrenches", tool_capacity: 11, checked_out: false, id: 2)
    hand_hammer = Tool.create!(name: "Hand Hammer", working_condition: true, quantity: 2, toolbox_id: 1)
    crescent_wrench = Tool.create!(name: "Crescent Wrench", working_condition: true, quantity: 1, toolbox_id: 2)

    visit '/tools'
     
    expect(page).to have_content(hand_hammer.name)
    expect(page).to have_content(hand_hammer.id)
    expect(page).to have_content(hand_hammer.working_condition)
    expect(page).to have_content(hand_hammer.quantity)
    expect(page).to have_content(hand_hammer.toolbox_id)
    expect(page).to have_content(hand_hammer.created_at)
    expect(page).to have_content(hand_hammer.updated_at)
    expect(page).to have_content(crescent_wrench.name)
    expect(page).to have_content(crescent_wrench.id)
    expect(page).to have_content(crescent_wrench.working_condition)
    expect(page).to have_content(crescent_wrench.quantity)
    expect(page).to have_content(crescent_wrench.toolbox_id)
    expect(page).to have_content(crescent_wrench.created_at)
    expect(page).to have_content(crescent_wrench.updated_at)
  end
end
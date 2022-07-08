require 'rails_helper'

RSpec.describe 'Toolboxes Index' do
  it 'shows the names of each toolbox' do
    hammers = Toolbox.create!(name: "Hammers", tool_capacity: 5, checked_out: false)
    wrenches = Toolbox.create!(name: "Wrenches", tool_capacity: 11, checked_out: false)

    visit '/toolboxes'

    expect(page).to have_content(hammers.name)
    expect(page).to have_content(wrenches.name)
  end
end
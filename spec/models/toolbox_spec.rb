require 'rails_helper'

RSpec.describe 'class methods' do
  it 'orders toolboxes by most recently created' do
    Tool.destroy_all
    Toolbox.destroy_all
    
    hammers = Toolbox.create!(name: "Hammers", tool_capacity: 5, checked_out: false)
    wrenches = Toolbox.create!(name: "Wrenches", tool_capacity: 11, checked_out: false)
    screwdrivers = Toolbox.create!(name: "Screwdrivers", tool_capacity: 7, checked_out:false)

    expect(Toolbox.order_by_recently_created.to_a).to eq([screwdrivers, wrenches, hammers])

  end
end
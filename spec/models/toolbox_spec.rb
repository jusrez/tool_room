require 'rails_helper'

RSpec.describe Toolbox do
  describe 'class methods' do
    it 'orders toolboxes by most recently created' do

      hammers = Toolbox.create!(name: "Hammers", tool_capacity: 5, checked_out: false)
      wrenches = Toolbox.create!(name: "Wrenches", tool_capacity: 11, checked_out: false)
      screwdrivers = Toolbox.create!(name: "Screwdrivers", tool_capacity: 7, checked_out:false)

      expect(Toolbox.order_by_recently_created.to_a).to eq([screwdrivers, wrenches, hammers])

    end
  end
  describe 'instance methods' do
    it 'shows a count of the number of tools associated with this toolbox' do

      hammers = Toolbox.create!(name: "Hammers", tool_capacity: 5, checked_out: false)
      wrenches = Toolbox.create!(name: "Wrenches", tool_capacity: 11, checked_out: false)
      screwdrivers = Toolbox.create!(name: "Screwdrivers", tool_capacity: 7, checked_out:false)
      hand_hammer = Tool.create!(name: "Hand Hammer", working_condition: true, quantity: 2, toolbox_id: hammers.id)
      crescent_wrench = Tool.create!(name: "Crescent Wrench", working_condition: true, quantity: 1, toolbox_id: wrenches.id)
      box_wrench = Tool.create!(name: "Box Wrench", working_condition: true, quantity: 1, toolbox_id: wrenches.id)

      expect(hammers.count_tools).to eq(1)
      expect(wrenches.count_tools).to eq(2)
      expect(screwdrivers.count_tools).to eq(0)
    end
  end
end
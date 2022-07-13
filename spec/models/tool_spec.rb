require 'rails_helper'

RSpec.describe Tool do
  describe 'class methods' do
    it 'only shows true records' do

      hammers = Toolbox.create!(name: "Hammers", tool_capacity: 5, checked_out: false)
      wrenches = Toolbox.create!(name: "Wrenches", tool_capacity: 11, checked_out: false)
      screwdrivers = Toolbox.create!(name: "Screwdrivers", tool_capacity: 7, checked_out:false)
      hand_hammer = Tool.create!(name: "Hand Hammer", working_condition: false, quantity: 2, toolbox_id: hammers.id)
      crescent_wrench = Tool.create!(name: "Crescent Wrench", working_condition: false, quantity: 1, toolbox_id: wrenches.id)
      box_wrench = Tool.create!(name: "Box Wrench", working_condition: true, quantity: 1, toolbox_id: wrenches.id)

      expect(Tool.show_true.to_a).to eq([box_wrench])
    end

    it 'organizes tools alphabetically' do
      hammers = Toolbox.create!(name: "Hammers", tool_capacity: 5, checked_out: false)
      wrenches = Toolbox.create!(name: "Wrenches", tool_capacity: 11, checked_out: false)
      screwdrivers = Toolbox.create!(name: "Screwdrivers", tool_capacity: 7, checked_out:false)
      crescent_wrench = Tool.create!(name: "Crescent Wrench", working_condition: false, quantity: 1, toolbox_id: wrenches.id)
      hand_hammer = Tool.create!(name: "Hand Hammer", working_condition: false, quantity: 2, toolbox_id: hammers.id)
      box_wrench = Tool.create!(name: "Box Wrench", working_condition: true, quantity: 1, toolbox_id: wrenches.id)

      expect(Tool.alphabetically.to_a).to eq([box_wrench, crescent_wrench, hand_hammer])
    end

    it 'only shows tools that have a larger quantity than the number provided' do
      hammers = Toolbox.create!(name: "Hammers", tool_capacity: 25, checked_out: false)
      hand_hammer = Tool.create!(name: "Hand Hammer", working_condition: false, quantity: 3, toolbox_id: hammers.id)
      mjolnir = Tool.create!(name: "Mjolnir", working_condition: true, quantity: 1, toolbox_id: hammers.id)
      mallet = Tool.create!(name: "Mallet", working_condition: true, quantity: 4, toolbox_id: hammers.id)

      expect(Tool.filter_by_quantity(2).to_a).to eq([hand_hammer, mallet])

           
    end
  end
end
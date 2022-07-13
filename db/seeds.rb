# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hammers = Toolbox.create!(name: "Hammers", tool_capacity: 5, checked_out: false)
wrenches = Toolbox.create!(name: "Wrenches", tool_capacity: 11, checked_out: false)
screwdrivers = Toolbox.create!(name: "Screwdrivers", tool_capacity: 7, checked_out:false)
hand_hammer = Tool.create!(name: "Hand Hammer", working_condition: false, quantity: 2, toolbox_id: hammers.id)
crescent_wrench = Tool.create!(name: "Crescent Wrench", working_condition: false, quantity: 1, toolbox_id: wrenches.id)
box_wrench = Tool.create!(name: "Box Wrench", working_condition: true, quantity: 1, toolbox_id: wrenches.id)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hammers = Toolbox.create!(name: "Hammers", tool_capacity: 5, checked_out: false, id: 1)
wrenches = Toolbox.create!(name: "Wrenches", tool_capacity: 11, checked_out: false, id: 2)
hand_hammer = Tool.create!(name: "Hand Hammer", working_condition: true, quantity: 2, toolbox_id: 1)
crescent_wrench = Tool.create!(name: "Crescent Wrench", working_condition: true, quantity: 1, toolbox_id: 2)
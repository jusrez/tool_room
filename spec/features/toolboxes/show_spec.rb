require 'rails_helper'

RSpec.describe 'Toolboxes Show' do
  describe 'I visit a toolbox show page' do
    it 'then I see all of the attributes for that toolbox' do
      hammers = Toolbox.create!(name: "Hammers", tool_capacity: 5, checked_out: false)
      wrenches = Toolbox.create!(name: "Wrenches", tool_capacity: 11, checked_out: false)

      visit "/toolboxes/#{hammers.id}"

      expect(page).to have_content(hammers.id)
      expect(page).to have_content(hammers.name)
      expect(page).to have_content(hammers.tool_capacity)
      expect(page).to have_content(hammers.checked_out)
      expect(page).to have_content(hammers.created_at)
      expect(page).to have_content(hammers.updated_at)
      expect(page).to_not have_content(wrenches.name)

    end
  end
end
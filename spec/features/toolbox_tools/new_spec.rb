require 'rails_helper'

RSpec.describe 'New Toolbox Tools' do
  describe 'As a visitor' do
    describe 'when I visit the toolboxes tools index page' do
      it 'then I see a link to create a new parent record' do
        hammers = Toolbox.create!(name: "Hammers", tool_capacity: 5, checked_out: false)
        visit "/toolboxes/#{hammers.id}/tools"

        click_link 'Create Tool'

        expect(current_path).to eq("/toolboxes/#{hammers.id}/tools/new")
      end
    end
    describe 'when I fill out the form with a new childs attributes and submit the form' do
      it 'creates a new tool record and redirects me to the toolbox tools index page where I see the new tool' do
        hammers = Toolbox.create!(name: "Hammers", tool_capacity: 5, checked_out: false)
        visit "/toolboxes/#{hammers.id}/tools/new"

        fill_in 'Name', with: 'Slinky'
        fill_in 'Working condition', with: 'true'
        fill_in 'Quantity', with: '2'
        fill_in 'Toolbox', with: "#{hammers.id}"
        click_on 'Create Tool'

        expect(current_path).to eq("/toolboxes/#{hammers.id}/tools")
        expect(page).to have_content('Slinky')
      end
    end
  end
end
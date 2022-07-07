class CreateToolboxes < ActiveRecord::Migration[5.2]
  def change
    create_table :toolboxes do |t|
      t.string :name
      t.integer :tool_capacity
      t.boolean :checked_out
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end

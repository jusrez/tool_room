class CreateTools < ActiveRecord::Migration[5.2]
  def change
    create_table :tools do |t|
      t.string :name
      t.boolean :working_condition
      t.integer :quantity
      t.datetime :created_at
      t.datetime :updated_at
      t.references :toolbox, foreign_key: true
    end
  end
end

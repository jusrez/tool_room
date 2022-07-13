class Tool < ApplicationRecord
  belongs_to :toolbox
  validates_presence_of :name
  validates_presence_of :quantity
  validates :working_condition, inclusion: [true, false]

  def self.show_true
    where(working_condition: true)
  end

  def self.alphabetically
    order(:name)
  end

  def self.filter_by_quantity(quantity)
    where('quantity > ?', quantity)
  end
end
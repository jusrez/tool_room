class Toolbox < ApplicationRecord
  has_many :tools, :dependent => :destroy
  validates_presence_of :name
  validates_presence_of :tool_capacity
  validates :checked_out, inclusion: [true, false]

  def self.order_by_recently_created
    order('created_at DESC')
  end

  def count_tools
    tools.count 
  end

  
end
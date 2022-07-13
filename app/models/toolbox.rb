class Toolbox < ApplicationRecord
  has_many :tools, :dependent => :destroy

  def self.order_by_recently_created
    order('created_at DESC')
  end

  def count_tools
    tools.count 
  end

  
end
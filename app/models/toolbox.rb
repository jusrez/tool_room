class Toolbox < ApplicationRecord
  has_many :tools

  def self.order_by_recently_created
    order('created_at DESC')
  end
end
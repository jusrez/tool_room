class Tool < ApplicationRecord
  belongs_to :toolbox

  def self.show_true
    where(working_condition: true)
  end
end
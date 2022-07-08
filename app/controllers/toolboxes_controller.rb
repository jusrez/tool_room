class ToolboxesController < ApplicationController
  def index
    @toolboxes = Toolbox.all
  end
end
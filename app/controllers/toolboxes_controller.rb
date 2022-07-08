class ToolboxesController < ApplicationController
  def index
    @toolboxes = Toolbox.all
  end

  def show
    @toolbox = Toolbox.find(params[:id])
  end
end
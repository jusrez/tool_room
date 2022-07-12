class ToolboxesController < ApplicationController
  def index
    @toolboxes = Toolbox.order_by_recently_created.to_a
  end

  def show
    @toolbox = Toolbox.find(params[:id])
  end
end
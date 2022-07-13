class ToolboxesController < ApplicationController
  def index
    @toolboxes = Toolbox.order_by_recently_created.to_a
  end

  def new
    @toolbox = Toolbox.new
  end

  def create
    toolbox = Toolbox.new(toolbox_params)

    toolbox.save

    redirect_to '/toolboxes'
  end

  def show
    @toolbox = Toolbox.find(params[:id])
  end

  private
  def toolbox_params
    params.require(:toolbox).permit(:name, :tool_capacity, :checked_out)
  end
end
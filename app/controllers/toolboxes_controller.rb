class ToolboxesController < ApplicationController
  def index
    @toolboxes = Toolbox.order_by_recently_created.to_a
  end

  def show
    @toolbox = Toolbox.find(params[:id])
  end

  def new
    @toolbox = Toolbox.new
  end

  def create
    toolbox = Toolbox.new(toolbox_params)

    toolbox.save

    redirect_to '/toolboxes'
  end

  def edit
    @toolbox = Toolbox.find(params[:id])
  end

  def update
    toolbox = Toolbox.find(params[:id])
    toolbox.update(toolbox_params)
    redirect_to "/toolboxes/#{toolbox.id}"
  end

  private
  def toolbox_params
    params.permit(:name, :tool_capacity, :checked_out)
  end
end
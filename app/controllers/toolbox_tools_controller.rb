class ToolboxToolsController < ApplicationController
  def index
    @toolbox = Toolbox.find(params[:id])
    if params[:sort] == "alphabetical"
      @tools = @toolbox.tools.alphabetically
    elsif params[:quantity]
      @tools = @toolbox.tools.filter_by_quantity(params[:quantity])
    else
      @tools = @toolbox.tools
    end
  end

  def new
    @toolbox = Toolbox.find(params[:id])
  end

  def create
    @toolbox = Toolbox.find(params[:id])
    @toolbox.tools.create(tool_params)
    redirect_to "/toolboxes/#{@toolbox.id}/tools"
  end

  private
  def tool_params
    params.permit(:name, :working_condition, :quantity, :toolbox_id)
  end
end
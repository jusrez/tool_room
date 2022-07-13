class ToolsController < ApplicationController
  def index
    @tools = Tool.show_true
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def edit
    @tool = Tool.find(params[:id])
  end

  def update
    tool = Tool.find(params[:id])
    tool.update(tool_params)
    redirect_to "/tools/#{tool.id}"
  end

  def destroy
    Tool.destroy(params[:id])
    redirect_to "/tools"
  end

  private
  def tool_params
    params.permit(:name, :working_condition, :quantity, :toolbox_id)
  end
end
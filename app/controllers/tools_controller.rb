class ToolsController < ApplicationController
  def index
    @tools = Tool.all
  end

  def show
    @tool = Toolbox.find(params[:id])
  end
end
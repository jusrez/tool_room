class ToolboxToolsController < ApplicationController
  def index
    @toolbox = Toolbox.find(params[:id])
    @tools = Tool.all
  end
end
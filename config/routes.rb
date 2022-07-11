Rails.application.routes.draw do

  get '/toolboxes', to: 'toolboxes#index'
  get '/toolboxes/:id', to: 'toolboxes#show'
  get '/tools', to: 'tools#index'
  get '/tools/:id', to: 'tools#show'
  get '/toolboxes/:id/tools', to: 'toolbox_tools#index'
end

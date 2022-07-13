Rails.application.routes.draw do

  get '/tools', to: 'tools#index'
  get '/tools/:id', to: 'tools#show'
  get '/toolboxes', to: 'toolboxes#index'
  get '/toolboxes/new', to: 'toolboxes#new'
  post '/toolboxes', to: 'toolboxes#create'
  get '/toolboxes/:id', to: 'toolboxes#show'
  get '/toolboxes/:id/tools', to: 'toolbox_tools#index'
  
end

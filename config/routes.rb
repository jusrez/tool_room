Rails.application.routes.draw do

  get '/tools', to: 'tools#index'
  get '/tools/:id', to: 'tools#show'
  get '/tools/:id/edit', to: 'tools#edit'
  patch '/tools/:id', to: 'tools#update'
  get '/toolboxes', to: 'toolboxes#index'
  get '/toolboxes/new', to: 'toolboxes#new'
  post '/toolboxes', to: 'toolboxes#create'
  get '/toolboxes/:id', to: 'toolboxes#show'
  get '/toolboxes/:id/edit', to: 'toolboxes#edit'
  patch 'toolboxes/:id', to: 'toolboxes#update'
  get '/toolboxes/:id/tools', to: 'toolbox_tools#index'
  get '/toolboxes/:id/tools/new', to: 'toolbox_tools#new'
  post '/toolboxes/:id/tools', to: 'toolbox_tools#create'
  delete '/toolboxes/:id', to: 'toolboxes#destroy'
  
end

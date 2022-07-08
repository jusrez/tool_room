Rails.application.routes.draw do

  get '/toolboxes', to: 'toolboxes#index'
  get '/toolboxes/:id', to: 'toolboxes#show'
end

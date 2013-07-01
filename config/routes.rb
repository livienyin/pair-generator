OnePlusOne::Application.routes.draw do
  resources :people


  resources :teams
  root to: 'groupings#index'
end

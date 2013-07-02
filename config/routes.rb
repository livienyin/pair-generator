OnePlusOne::Application.routes.draw do
  resources :people
  resources :teams
  resources :groupings do
    resources :people
    resources :teams
  end
  root to: 'groupings#index'
end

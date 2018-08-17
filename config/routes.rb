Rails.application.routes.draw do

  get 'static/index_townhalls', to: 'static#index_townhalls'
  get 'static/index_journalists', to: 'static#index_journalists'
  root 'users#index'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

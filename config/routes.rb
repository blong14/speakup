Rails.application.routes.draw do

  root 'ideas#index'
  resources :ideas, only: [:create, :show, :new]
  resources :votes, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

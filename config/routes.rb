Rails.application.routes.draw do
  devise_for :users
  resources :tasks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: "home#index"
  root 'tasks#index' , as: 'home'

  get 'details' => 'details#details', as: 'details'


  resources :tasks
end

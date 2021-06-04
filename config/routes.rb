Rails.application.routes.draw do
  root "arcades#index"

  devise_for :users

  resources :machines
  resources :favorites
  resources :comments
  resources :arcades
  resources :games
  
  get ":username" => "users#show", as: :user
  get ":username/feed" => "users#feed", as: :feed


end

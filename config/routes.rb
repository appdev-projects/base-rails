Rails.application.routes.draw do
  root "arcades#index"

  devise_for :users

  resources :machines
  resources :favorites
  resources :comments
  resources :arcades
  resources :games
  
end

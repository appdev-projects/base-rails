Rails.application.routes.draw do
  resources :machines
  resources :favorites
  resources :comments
  root "arcades#index"


  resources :arcades
  resources :games
  devise_for :users
end

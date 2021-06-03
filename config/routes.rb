Rails.application.routes.draw do
  root "arcades#index"


  resources :arcades
  resources :games
  devise_for :users
end

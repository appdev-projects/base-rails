Rails.application.routes.draw do



  resources :arcades
  resources :games
  devise_for :users
end

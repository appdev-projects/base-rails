Rails.application.routes.draw do
  
  root "home#index"
  
  resources :lesson_events

  devise_for :seekers
  

end

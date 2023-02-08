Rails.application.routes.draw do
  
  root "application#index"
  
  resources :lesson_events

  devise_for :seekers
  

end

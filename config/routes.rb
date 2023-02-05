Rails.application.routes.draw do
  
  root "lesson_events#index"
  
  resources :lesson_events

  devise_for :seekers
  

end

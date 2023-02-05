Rails.application.routes.draw do

  devise_for :seekers
root "home#index"

end

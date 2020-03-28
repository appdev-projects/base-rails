Rails.application.routes.draw do
  root "application#home"
  get "/all" => "application#all"

  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end

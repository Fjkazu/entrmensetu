Rails.application.routes.draw do
  get 'interviews/index'
 
  root to: "interviews#index"
  resources :interviews
end

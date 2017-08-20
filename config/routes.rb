Rails.application.routes.draw do
  resources :urls
  resources :stats, only: [:show]
end

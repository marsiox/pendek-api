Rails.application.routes.draw do

  namespace :api do
    root to: "home#index"
    resources :urls, only: [:index, :show, :create]
  end

  get "/", to: redirect('/api')
  get "/:short", to: "redirections#index"

end

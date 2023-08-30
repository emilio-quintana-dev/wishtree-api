Rails.application.routes.draw do
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  resources :payments

  resources :users, only: %i[show update]

  post "/create-checkout-session", to: "checkout_session#create"

  resources :wishes, only: %i[
    update
    create
    destroy
  ]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"

  root to: "static#home"
end

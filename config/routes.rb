Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :flats do
    resources :bookings, only: %i[show new create destroy]
  end
  get '/profile', to: "pages#profile"
end

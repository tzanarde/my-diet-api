Rails.application.routes.draw do
  resources :items
  resources :meals
  resources :days
  resources :types
  resources :units
  resources :foods

  get '/food_of_the_day', to: 'daily_report#food_of_the_day'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

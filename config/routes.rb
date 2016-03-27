Rails.application.routes.draw do
  devise_for :users
  root 'events#index'

  get '/yourevents', to: 'events#user_events'

  resources :events do
    resources :tickets
  end

  post '/ticket/finish', to: 'tickets#create'

  resources :events do
    resources :ticket_types
  end

  resources :venues
end

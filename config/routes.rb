Rails.application.routes.draw do
  devise_for :users
  root 'events#index'

  get '/yourevents', to: 'events#user_events'

  post '/ticket/purchase', to: 'tickets#purchase'

  get '/ticket/finish', to: 'tickets#finish'

  resources :events,  except: :destroy do
    resources :tickets, except: :edit
  end

  resources :events, except: :destroy do
    resources :ticket_types
  end

  resources :venues, only: [:new, :create]
end

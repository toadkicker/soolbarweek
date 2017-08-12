Rails.application.routes.draw do
  devise_for :users
  resources :locations
  resources :sponsors
  resources :profiles
  resources :events

  resources :checkouts, only: [:show, :new, :create]

  resources :locales do
    resources :translations, constraints: { :id => /[^\/]+/ }
  end

  resources :admin_users

  get '/privacy', to: 'pages#show', page: 'privacy'
  get '/terms-of-service', to: 'pages#show', page: 'tos'
  get '/about', to: 'pages#show', page: 'about'

  get '/contact', to: 'messages#new', page: 'contact', as: 'contact'
  post '/contact', to: 'messages#create', as: 'new_message'

  get '/thank-you', to: 'pages#show', page: 'thankyou', as: 'thankyou'
  get '/transit', to: 'pages#show', page: 'transit', as: 'transit'

  get '/order-history', to: 'order_items#index', as: 'order_history'

  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]

  root 'pages#show', page: 'index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

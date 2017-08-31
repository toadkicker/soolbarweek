Rails.application.routes.draw do
  resources :galleries
  devise_for :users
  resources :locations
  resources :sponsors
  resources :profiles
  resources :events
  resources :charges, only: [:index, :new, :create]

  get "/charges/receipt/:id", to: "charges#receipt", as: 'receipt_mailer'

  post 'email_responses/bounce' => 'email_responses#bounce'
  post 'email_responses/complaint' => 'email_responses#complaint'

  resources :locales do
    resources :translations, constraints: { id: /[^\/]+/ }
  end

  namespace :admin do
    resources :users
    resources :orders
    resources :order_statuses
  end

  get '/privacy', to: 'pages#show', page: 'privacy'
  get '/terms-of-service', to: 'pages#show', page: 'tos'
  get '/about', to: 'pages#show', page: 'about'

  get '/contact', to: 'messages#new', page: 'contact', as: 'contact'
  post '/contact', to: 'messages#create', as: 'new_message'

  get '/thank-you', to: 'pages#show', page: 'thankyou', as: 'thankyou'
  get '/transit', to: 'pages#show', page: 'transit', as: 'transit'

  resource :cart, only: [:show]
  resources :order_items, only: %i[index create update destroy]

  root 'pages#show', page: 'index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

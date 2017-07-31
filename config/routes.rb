Rails.application.routes.draw do
  resources :locations
  resources :sponsors
  resources :profiles
  resources :events

  #app.get('/', root_url.index);
  # app.get('/privacy', legal.privacy);
  # app.get('/terms-of-service', legal.tos);
  # app.get('/events', events.index);
  # app.get('/events/:id', events.show);
  # app.post('/events/:id', events.order);
  # app.get('/locations', locations.index);
  # app.get('/registration', registration.index);
  # app.get('/login', login.index);
  # app.get('/profiles', profiles.index);
  # app.get('/profiles/:id', profiles.show);
  # app.get('/sponsors', sponsors.index);
  # app.get('/contact', contact.index);
  # app.get('/thankyou', thankyou.index);
  # app.post('/contact', contact.post);
  # app.get('/about', about.index);

  get '/privacy', to: 'pages#show', page: 'privacy'
  get '/terms-of-service', to: 'pages#show', page: 'tos'
  get '/about', to: 'pages#show', page: 'about'

  get '/contact', to: 'messages#new', as: 'new_message'
  post '/contact', to: 'messages#create', as: 'create_message'

  root 'pages#show', page: 'index'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

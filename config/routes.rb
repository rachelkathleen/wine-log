Rails.application.routes.draw do

  resources :wines, only: [:new, :create, :edit, :update, :show]
  resources :users, only: [:new, :create, :edit, :update]

  resources :countries, only: [:index] do
    resources :wines, only: [:new, :show, :create]
  end

  root 'sessions#welcome'
  get '/goodbye' => 'sessions#goodbye'


  get '/aromas' => 'learn#aromas'
  post '/aromas' => 'learn#aromas'
  get '/glossary' => 'learn#glossary'
  post '/glossary' => 'learn#glossary'

  get '/about' => 'learn#about'

  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/home' => 'users#home'
  get '/auth/facebook/callback' => 'sessions#fb_create'

  get '*path' => redirect('/')

end

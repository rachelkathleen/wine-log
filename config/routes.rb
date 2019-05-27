Rails.application.routes.draw do

  resources :wines
  resources :users, only: [:new, :create, :edit, :update]
  resources :varietals

  resources :countries, only: [:index, :show] do
    resources :wines, only: [:index, :new, :show]
  end


  root 'sessions#welcome'
  get '/goodbye' => 'sessions#goodbye'

  # root 'learn#aromas'
  # root 'learn#glossary'

  get '/aromas' => 'learn#aromas'
  get '/glossary' => 'learn#glossary'

  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/home' => 'users#home'
  get '/auth/facebook/callback' => 'sessions#fb_create'



end

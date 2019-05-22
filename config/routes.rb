Rails.application.routes.draw do

  resources :wines
  resources :users do
    resources :wines, only: [:show, :index, :new, :create, :edit]
  end
  resources :wine_aromas, only: [:new, :create]


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



end

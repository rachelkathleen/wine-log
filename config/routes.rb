Rails.application.routes.draw do

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



  resources :wines
  resources :users do
    resources :wines, only: [:show, :index, :new]
  end
end

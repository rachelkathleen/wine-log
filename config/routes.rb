Rails.application.routes.draw do

  resources :wines, only: [:new, :create, :show, :edit]
  resources :users, only: [:new, :create, :edit]

  resources :countries, only: [:index, :new, :create] do
    resources :wines, only: [:index, :new]
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



end

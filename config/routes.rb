Rails.application.routes.draw do

  root 'users#index'

  get 'sessions/new' => 'sessions#new', as: 'log_in'
  post 'sessions' => 'sessions#create'

  get 'sessions/user' => 'sessions#destroy'
  delete 'sessions' => 'sessions#destroy', as: 'log_out'

  get 'profiles' => 'profiles#index'

  get '/search', to: 'shows#search', as: 'search'
  post '/search', to: 'shows#results'

  post '/users/shows', to: 'users#add_show'

  resources :users do
    resources :shows
  end


end
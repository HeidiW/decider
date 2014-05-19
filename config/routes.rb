Rails.application.routes.draw do

	resources :users do
    	resources :shows
	end

    get 'users/new' => "users#new"
    post 'users' => "users#create"
    get 'users' => "users#index"
    root "users#index"

    get 'sessions/new' => 'sessions#new', as: 'log_in'
    post 'sessions' => 'sessions#create'

    get 'sessions/user' => 'sessions#destroy'
    delete 'sessions' => 'sessions#destroy', as: 'log_out'

    get 'profiles' => 'profiles#index'

	get '/search', to: 'shows#search'
	post '/search', to: 'shows#results'

end


 





  


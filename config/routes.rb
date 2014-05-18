Rails.application.routes.draw do

	resources :users do
    	resources :shows
	end
    
	get '/search', to: 'shows#search'
	post '/search', to: 'shows#results'

end

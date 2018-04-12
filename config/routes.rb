Rails.application.routes.draw do

	root 'home#index'
	get 'home/index'

	get '/auth/twitter/callback' => 'sessions#create'
  	get '/auth/failure' => 'sessions#fail'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

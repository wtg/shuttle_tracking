Tracking::Application.routes.draw do
  resources :users
  
	resources :user_sessions  
	
  resources :stops

  resources :statuses

  resources :routes

  resources :positions

  resources :vehicles
  
  match 'login' => 'user_sessions#new', :as => :login
  
  match 'logout' => 'user_sessions#destroy', :as => :logout
  
  root :to => "displays#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

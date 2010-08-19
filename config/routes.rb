Tracking::Application.routes.draw do
  resources :users
  
	resources :user_sessions  
	
  resources :stops, :collection => {:current => :get}

  resources :statuses

  resources :routes

  resources :positions, :collection => {:current => :get}

  resources :vehicles
  
  match 'login' => 'user_sessions#new', :as => :login
  
  match 'logout' => 'user_sessions#destroy', :as => :logout
  
  match '/displays/kml', :to => 'displays#kml'
  
  match 'shuttle_tracking.kml', :to => 'displays#kml'

  root :to => "displays#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

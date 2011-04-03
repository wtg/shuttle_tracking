Tracking::Application.routes.draw do
  resources :pages

  devise_for :users

  resources :icons
  match '/icons/:id/rotate/:heading(.:format)', :to => 'icons#rotate', :as => 'rotate_icon'

  match '/users/all', :to => 'users#index'
  resources :users, :except => [:create, :new]
  
  resources :statuses, :except => [:show]

  resources :routes
  
  resources :vehicles do
    collection do
      get :current
    end
    resources :updates, :except => [:show]
  end
    
  resources :stops
    
  match '/displays/static', :to => 'displays#static'
  match '/displays/netlink', :to => 'displays#netlink'
  match '/displays/image', :to => 'displays#image'
    
  #match 'shuttle_tracking.kml', :to => 'displays#kml'

  root :to => "displays#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

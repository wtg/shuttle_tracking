ActionController::Routing::Routes.draw do |map|
  map.resources :statuses

  map.resources :positions, :collection => {:current => :get}

  map.resources :routes

  map.resources :stops, :collection => {:current => :get}

  map.resources :shuttles

  map.connect 'shuttle_tracking.kml', :controller => 'displays', :action => 'kml'

  map.connect 'logout', :controller => 'application', :action => 'logout'
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

class RouteSweeper < ActionController::Caching::Sweeper
  observe Route
  
  def after_create(route)
    expire_cache_for(route)
  end
  
  def after_update(route)
    expire_cache_for(route)
  end
  
  def after_destroy(route)
    expire_cache_for(route)
  end
  
  private
  def expire_cache_for(record)
    logger.info("Expiring js route #{record.id} cache...")
    expire_fragment(:controller => 'routes', :action => 'show', :id=>record.id, :action_suffix => 'kml')
  end
end

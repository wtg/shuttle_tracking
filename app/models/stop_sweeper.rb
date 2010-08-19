class StopSweeper < ActionController::Caching::Sweeper
  observe Stop
  
  def after_create(stop)
    expire_cache_for(stop)
  end
  
  def after_update(stop)
    expire_cache_for(stop)
  end
  
  def after_destroy(stop)
    expire_cache_for(stop)
  end
  
  private
  def expire_cache_for(record)
    logger.info("Expiring js stop cache...")
    expire_fragment(:controller => 'stops', :action => 'index', :action_suffix => 'js')
  end
end

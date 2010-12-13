class IconSweeper < ActionController::Caching::Sweeper
  observe Icon

  def after_update(icon)
    expire_cache_for(icon)
  end

  def after_destroy(icon)
    expire_cache_for(icon)
  end

  private
  def expire_cache_for(icon)
    360.times do |i|
      expire_page(:controller => 'icons', :action => 'rotate', :id => icon, :heading => i, :format => 'png')
    end
  end
end

class DisplaysController < ApplicationController

  def index
    render :layout => 'full_map'
  end
  
  def kml
    #Generate route information
    @routes = Route.find(:all, :conditions => {:enabled => true})
    
    #Generate stop information
    @stops = Stop.find(:all, :group => :id, :joins => :routes, :conditions => {:enabled => true, 'routes.enabled' => true})
    
    respond_to do |format|
      format.kml { render :layout => false }
    end
  end

  def locations
    @shuttles = Shuttle.find(:all, :conditions => {:enabled => true})    
  end

end

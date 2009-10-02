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
    case params[:active]
      when "Online" then
        @shuttles = Shuttle.find(:all, :conditions => {:enabled => true, :active => true})
      when "Offline" then
       @shuttles = Shuttle.find(:all, :conditions => {:enabled => true, :active => false})
      when "All" then
        @shuttles = Shuttle.find(:all, :conditions => {:enabled => true})
      else
        @shuttles = Shuttle.find(:all, :conditions => {:enabled => true})
    end
    
    respond_to do |format|
      format.xml
      format.html
    end

  end

end

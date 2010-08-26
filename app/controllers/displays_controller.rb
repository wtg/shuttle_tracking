class DisplaysController < ApplicationController

  def index
    render :layout => 'full_map'
  end
  
  def kml
    #Generate route information
    @routes = Route.where({:enabled => true})
    
    #Generate stop information
    @stops = Stop.all(:joins => :routes).group(:id).where({:enabled => true, 'routes.enabled' => true})
    
    respond_to do |format|
      format.kml { render :layout => false }
    end
  end

  def locations
    case params[:active]
      when "Online" then
        @shuttles = Shuttle.where({:enabled => true, :active => true})
      when "Offline" then
        @shuttles = Shuttle.where({:enabled => true, :active => false})
      when "All" then
        @shuttles = Shuttle.where({:enabled => true})
      else
        @shuttles = Shuttle.where({:enabled => true})
    end
    
    respond_to do |format|
      format.xml
      format.html
    end

  end

end

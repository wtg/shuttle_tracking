class DisplaysController < ApplicationController

  def index
    render :layout => 'full_map'
  end

  # Generate a static KML file, a snapshot of the system.
  # Works well for devices that don't understand network links.
  def static
    @stops = Stop.enabled
    @routes = Route.enabled
    @vehicles = Vehicle.active

    respond_to do |format|
      format.kml
    end
  end

  # Generates a network-link based KML file, a snapshot of the 
  # routes and stops.  The vehicles will be loaded via network link.
  def netlink
    @stops = Stop.enabled
    @routes = Route.enabled
 
    respond_to do |format|
      format.kml
    end
  end
  
end

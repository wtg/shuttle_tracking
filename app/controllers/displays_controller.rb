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

  # Generate a static image of the current vehicle positions.
  # Current a work in progress...
  def image
    @vehicles = Vehicle.all
    
    @icons = Hash.new
    @vehicles.each do |v|
      if !v.latest_position.nil?
        icon = v.icon_id || 0
        heading = v.latest_position.heading
        if @icons.has_key?(icon)
          if @icons[icon].has_key?(heading)
            @icons[icon][heading].push(v)
          else
            @icons[icon][heading] = [v]
          end
        else
          @icons[icon] = Hash.new
          @icons[icon][heading] = [v]
        end
      end
    end
  end
  
end

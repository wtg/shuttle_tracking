xml.Folder do
  xml.name "Vehicle Tracking"
  xml.description "A dynamically updating vehicle tracking map."
  
  @routes.each do |route|
    xml << render(:partial => 'routes/style', :locals => {:route => route})
    xml << render(route)
  end

  @stops.each do |stop|
    xml << render(stop)
  end

  xml.NetworkLink do
    xml.name "Vehicles"
    xml.description "Updating every 15 seconds"
    xml.refreshVisibility 0
    xml.Link do
      xml.href url_for current_vehicles_path(:format => :kml, :only_path => false)
    end
  end
end

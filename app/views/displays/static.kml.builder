xml.Folder do
  xml.name "Vehicle Tracking"
  xml.description "A snapshot of the vehicle tracking map."
  @vehicles.each do |vehicle|
    xml << render(vehicle)
  end
  
  @routes.each do |route|
    xml << render(:partial => 'routes/style', :locals => {:route => route})
    xml << render(route)
  end

  @stops.each do |stop|
    xml << render(stop)
  end
end

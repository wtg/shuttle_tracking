xml.Folder do
  xml.name (@all_stops ? "All Stops" : "Active Stops")
  @stops.each do |stop|
    xml << render(stop)
  end
end 

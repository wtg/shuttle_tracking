xml.Placemark(:id => "vehicle_#{vehicle.id}") do 
  xml.name vehicle.name
  xml.description "Traveling #{vehicle.latest_position.cardinal_point} at #{vehicle.latest_position.speed}mph."
  xml.Point do
    xml.coordinates "#{vehicle.latest_position.longitude},#{vehicle.latest_position.latitude}" 
  end 
end 

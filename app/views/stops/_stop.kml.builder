xml.Placemark(:id => "stop_#{stop.id}") do 
  xml.name stop.name
  xml.Point do
    xml.coordinates "#{stop.longitude},#{stop.latitude}" 
  end 
end 


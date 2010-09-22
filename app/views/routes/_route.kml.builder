xml.Placemark(:id => "route_#{route.id}") do 
  xml.name route.name
  xml.description do 
    xml.cdata! route.description
  end
  xml.styleUrl "#route_#{route.id}"
  xml.LineString do
    xml.coordinates do
      route.coords.each do |coord|
        xml.text! "#{coord.longitude},#{coord.latitude} \n" 
      end 
    end
  end 
end

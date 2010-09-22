xml.Style(:id => "route_#{route.id}") do
  xml.LineStyle do
    xml.color to_kmlcolor(route.color)
    xml.width route.width
  end
end

xml.Folder do
  xml.name @route.name
  xml << render(:partial => 'style', :locals => {:route => @route})
  xml << render(@route)
  @route.stops.each do |stop|
    xml << render(stop)
  end
end

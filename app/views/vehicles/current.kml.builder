xml.Folder do
  xml.name "Current Vehicle Positions"
  @vehicles.each do |vehicle|
    xml << render(vehicle)
  end
end 

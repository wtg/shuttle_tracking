xml.Folder do
  xml << render(:partial => 'style', :locals => {:route => @route})
  xml << render(@route)
end

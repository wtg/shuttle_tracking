class DisplaysController < ApplicationController

  def index
    render :layout => 'full_map'
  end
  
  def kml
    #Generate route information
    @routes = Route.find(:all, :conditions => {:enabled => true})
    
    #Generate route URL's
    @routes.each do |r|
      r.kml_url = ABS_PATH + r.kml.url unless r.kml_file_name.nil?
    end
    
    respond_to do |format|
      format.kml { render :layout => false }
    end
  end

  def locations
    @shuttles = Shuttle.find(:all, :conditions => {:enabled => true})    
  end

end

class IconsController < ApplicationController
  require 'RMagick'
  
  caches_page   :rotate
  
  # GET /icons/rotate/1.format
  def rotate
    degrees = 0
    degrees = params[:id] unless params[:id].blank?
    
    #I can't get small transparent pngs to look after rotating.
    #Getting an SVG image highly desireable, as some initial tests indicated
    #it performs very well
     
    icon = Magick::ImageList.new(RAILS_ROOT+'/public/images/white_shuttle_icon.png')
    icon.rotate!(degrees.to_f)
    icon.fuzz = 20000
    clear_icon = icon.transparent('white')
    
    respond_to do |format|
      format.jpg {
        clear_icon.format = 'jpg'
        send_data clear_icon.to_blob, :filename => "#{degrees}.jpg", :disposition => 'inline', :type => "image/jpeg"
      }
      format.png  {
        clear_icon.format = 'png'
        send_data clear_icon.to_blob, :filename => "#{degrees}.png", :disposition => 'inline', :type => "image/png"
      }
      format.gif  {
        clear_icon.format = 'gif'
        send_data clear_icon.to_blob, :filename => "#{degrees}.gif", :disposition => 'inline', :type => "image/gif"
      }
    end
      end

end

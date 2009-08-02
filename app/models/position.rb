class Position < ActiveRecord::Base
  belongs_to :shuttle
  belongs_to :status
  
  attr_accessor :icon_width, :icon_height
  
  def build_icon
    if(!self.heading.nil?)
      require 'RMagick'
      icon = Magick::ImageList.new(RAILS_ROOT+'/public/images/white_shuttle_icon.png')
      icon.rotate!(self.heading.to_f)
      self.icon_width = icon.columns
      self.icon_height = icon.rows
    else
      self.icon_width = 0
      self.icon_height = 0
    end
  end
end

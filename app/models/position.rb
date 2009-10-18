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

  def locate
    require 'open-uri'
    url = "http://maps.google.com/maps/geo?q=#{self.latitude},#{self.longitude}&output=json&oe=utf8&key=" + GMAPKEY
    json = ""
    open(url) {|f|
      data = f.read
      json = ActiveSupport::JSON.decode(data)
    }
    addresses = {}
    if(json["Placemark"].nil?)
      return nil
    end
    json["Placemark"].each do |a|
       if (a["address"] != 'Rensselaer Polytechnic Institute, Troy, NY 12180, USA')
         addresses[a["AddressDetails"]["Accuracy"]] = a["address"]
       else
         addresses[6] = a["address"] #Numbers below 4 seemed reserved for city/state/country
       end
    end
    ranked_addresses = addresses.sort
    best = ranked_addresses.last.last.to_s #first last = best address, second last = address portion of array [accuracy][address]

    #Clean up the locations to remove assumed things (like Troy, the US, etc)
    #If there is something like NY 12180, remove the zip code
    if best =~ /(\w{2}) (\d{5})/
      best[/(\w{2}) (\d{5})/,2] = ''
    end
    pieces = best.split(',')
    pieces.collect! {|x| x.strip }
    if pieces.last == 'USA'
      pieces.pop
    end
    if pieces.last == 'NY'
      pieces.pop
    end
    if pieces.last == 'Troy'
      pieces.pop
    end
    
    merged = pieces.join(', ')
    return merged
  end

  def compass_rose
    if self.heading.blank?
      return ""
    end
    if self.heading <45 || self.heading > 315
      return "North"
    elsif self.heading > 45 && self.heading < 135
      return "East"
    elsif self.heading > 135 && self.heading < 225
      return "South"
    elsif self.heading > 225 && self.heading < 315
      return "West"
    else
      return ""
    end
  end

end

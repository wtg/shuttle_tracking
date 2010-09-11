require 'open-uri'
require 'uri'

namespace :sample do
  desc "Update the vehicle locations."
  task :update => :environment do
    open(URI.escape('http://localhost/datafeed')) do |f|
      f.each_line do |line|

        # In here you might want to map you data fields
        # to the attributes for an update.
        # My placeholders include:
        # $1 - Vehicle Identifier
        # $2 - Latitude
        # $3 - Longitude
        # $4 - Heading
        # $5 - Speed
        # $6 - GPS Accuracy
        # $7 - Status
        # $8 - Time

        vehicle = Vehicle.where(:identifier => $1).first
        if !vehicle.nil?
          # Time to see if the update is actually from the future.
          # And by that I mean, check if this update is represents
          # new data (i.e has a timestamp > the old data)
          last_update = vehicle.updates.latest.first
          if last_update.nil? || last_update.timestamp < timestamp
            # Actually build an update
            update = vehicle.updates.new(
              :latitude => $2.to_f,
              :longitude =>$3.to_f,
              :heading => $4.to_i,
              :speed => $5.to_i,
              :lock => $6.to_i,
              :status_code => $7.to_s,
              :timestamp => $8
            )
            if update.save
              puts "Updated #{vehicle.name}"
            else
              #Debug why the update isn't valid
              update.errors.full_messages.each do |msg|
                puts msg
              end
            end
          else
           puts "No Change #{vehicle.name}."
          end
        else
          puts "No vehicle with ID #{$1}."
        end
      end
    end
    puts "Finished at @ #{DateTime.current()}"
  end
end

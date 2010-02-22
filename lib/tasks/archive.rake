namespace :shuttles do
  desc "Archive all events older than XXX"
  task :archive => :environment do
    if !ENV['time'].nil?
      since = ENV['time']
    else
      since = 'yesterday'
    end
    max = Time.parse since
    puts "Archiving positions older than #{max}."
    positions = Position.find(:all, :conditions => ["created_at < :time", {:time => max}])
    count = positions.length
    puts "Found #{count} to archive"
    positions.each do |pos|
      attributes = pos.attributes
      attributes.delete("id")
      archive = ArchivePosition.create attributes
      if archive.save
        pos.destroy
      else
        puts "Unable to move position #{pos.id}."
      end
    end
  end
end

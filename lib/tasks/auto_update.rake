namespace :tracking do
  desc 'Run an update every few seconds until the process is killed.'
  task :auto_update => :environment do
    interval = BACKEND_UPDATE
    while true
      start_time = Time.now
      Rake::Task['sample:update'].execute
      end_time = Time.now

      #How long did the update take?
      run_time = end_time - start_time
      #If the update took super long (or a bogus answer), ignore the previous run
      run_time = 0 if (run_time < 0 || run_time > interval)
      #Figure out how long to sleep 
      sleep_time = interval - run_time
      puts "Sleeping #{sleep_time}"

      sleep sleep_time
    end
  end
end

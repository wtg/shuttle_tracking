namespace :tracking do
  desc 'Run an update every few seconds until the process is killed.'
  task :auto_update => :environment do
    interval = 15
    while true
      start_time = Time.now
      Rake::Task['sample:update'].execute
      end_time = Time.now

      run_time = end_time - start_time
      sleep_time = interval - run_time
      puts "Sleeping #{sleep_time}"

      sleep sleep_time
    end
  end
end

Shuttle Tracking
================
RPI Student Senate Web Tech Group
http://webtech.union.rpi.edu

Deployed at: http://shuttles.rpi.edu

Setup
-----

1. Create a database.yml file, use database.yml.sample as an example if you need it.
2. Create config/initializers/shuttle_tracking.rb based off shuttle_tracking.rb.sample.
Specific a Google Maps API Key appropriate for you domain, and set the location the map
should center to by default.
3. Run rake db:migrate to setup the database
4. Enjoy the ability to track shuttles!


Archiving
---------

Archiving can reduce the size of your daily database, moving positions less likely to be
queried into the archive_positions table.  To archive, run `rake shuttles:archive`.
By default this will archive any positions with a created_at time older than yesterday.
To override this default behavior, pass in a time variable containing you're best formed
date like `rake shuttles:archive time='2009-09-02'`.

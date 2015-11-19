# Shuttle Tracking v1

RPI's shuttle tracking web application.

*Note: a refresh of Shuttle Trackers is under development, which can be found [here](https://github.com/wtg/shuttle_tracking_2).*

### Dependencies

* Prerequisites: MySQL, Rails 3, ImageMagick
* Prerequisite Gems: MySQL, god, chronic_duration, RMagick
* Plugins Used: Attachable, AuthLogic

### Installation

```bundle install```

Fill-in `database.yml`

```rake db:migrate```

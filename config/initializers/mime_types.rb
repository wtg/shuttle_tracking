# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf
# Mime::Type.register_alias "text/html", :iphone

# This is useful in debugging
#Mime::Type.register "text/plain", :kml
# ... but in production you want this
Mime::Type.register "application/vnd.google-earth.kml+xml", :kml

Mime::Type.register "image/png", :png
Mime::Type.register "image/jpeg", :jpg
Mime::Type.register "image/gif", :gif

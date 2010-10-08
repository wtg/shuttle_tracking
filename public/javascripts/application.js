// Create a new map, centered around 
// center_point, with the specified
// zoomlevel, and put it in the identified
// div (defaults to "map_canvas")
function setup_map(center_point, zoom_level, div){
  div = div || "map_canvas"; //A default value
  var center = new google.maps.LatLng(center_point.latitude, center_point.longitude);
  var options = {
    zoom: zoom_level,
    center: center,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  var map = new google.maps.Map(document.getElementById(div), options);
  return map;
}

// Add a point (marker) to a map object.
// The point should be an object with a
// name, description, latitude, and longitude.
// Optional: options can be used to override
// and of the properties of the marker.
// return_info (if true) will return an array
// object containing the marker AND infowindow
function add_point_to_map(point, map, options, return_info){
  if (typeof return_info == "undefined") {
    return_info = false;
  }
  var infowindow = new google.maps.InfoWindow({
    content: point.description
  });
  
  var opts = {
    position: new google.maps.LatLng(point.latitude, point.longitude), 
    map: map,
    title: point.name
  };
  
  jQuery.extend(opts, options);
    
  var marker = new google.maps.Marker(opts);
  
  google.maps.event.addListener(marker, 'click', function() {
    infowindow.open(map, marker);
  });
  
  if(return_info){
    return [marker, infowindow];
  } else {
    return marker;
  }
}

// Wraps add_point_to_polyobject
function add_point_to_polyline(point, polyline){
  return add_point_to_polyobject(point, polyline);
}

// Add a coordinate to a polygon or polyline 
// for display purposes only.  Does NOT
// effect any data structure we care about.
function add_point_to_polyobject(point, polyobject){
  var position = new google.maps.LatLng(point.latitude, point.longitude);
  polyobject.getPath().push(position);
  return position;
}

// Add a coordinate to the coordinate datastructure.
// Requires reference to the location holding the hidden fields.
function add_coord_to_form(prefix, coord, i, holder){
  //Add Latitude
  $('<input>').attr({
    id: prefix + '_coords_attributes_' + i + '_latitude',
    name: prefix + '[coords_attributes][' + i + '][latitude]',
    value: coord.latitude,
    type: 'hidden',
  }).appendTo(holder);
  //Add Longitude
  $('<input>').attr({
    id: prefix + '_coords_attributes_' + i + '_longitude',
    name: prefix + '[coords_attributes][' + i + '][longitude]',
    value: coord.longitude,
    type: 'hidden',
  }).appendTo(holder);
  //Add Position
  $('<input>').attr({
    id: prefix + '_coords_attributes_' + i + '_position',
    name: prefix + '[coords_attributes][' + i + '][position]',
    'class': 'coord_position_data',
    value: coord.position,
    type: 'hidden',
  }).appendTo(holder);
}

// Update the hidden fields with the
// latitude and longitude.
function update_coord_fields(prefix, marker, latLng){
  var index = marker_data[marker.get('data_id')].html_id;
  $('#' + prefix + '_coords_attributes_' + index + '_latitude').val(latLng.lat());
  $('#' + prefix + '_coords_attributes_' + index + '_longitude').val(latLng.lng());
  return true;
}

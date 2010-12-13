var map; //The map!
var shuttles = new Object();
var updater; // The auto-updater

function stop_updating(){
  clearInterval(updater);
}

function routes_and_stops(){
  $.getJSON(netlink_data_path, function(data){
    $.each(data.stops, function(i, stop){
      stop['description'] = stop_description(stop); 
      var stop_marker = add_point_to_map(stop, map, {icon: stop_icon_path});
    });
    $.each(data.routes, function(i, route){
      var polyline = new google.maps.Polyline({
        strokeColor: route.color,
        strokeWeight: route.width
      });
      $.each(route.coords, function(index, coord){
        position = add_point_to_polyline(coord, polyline);
      });
      polyline.setMap(map);
    });
  });
  $('#status').text("Static data OK.");
  return true;
}

function update(){
  $.getJSON(current_data_path, function(data){
    var now = new Date();
    // Pass through every update and move / create the appropriate marker
    $.each(data, function(i, obj){
        var vehicle = obj.vehicle;

        // Remap some of the attributes so they aren't so deep.
        vehicle['latitude'] = vehicle.latest_position.latitude;
        vehicle['longitude'] = vehicle.latest_position.longitude;

        // Figure out what goes in the infobubble
        vehicle['description'] = shuttle_description(vehicle);

        if(vehicle.id in shuttles){
          // The shuttle is already on the map, all we have to do is update it.
          var marker = shuttles[vehicle.id];
          marker.setPosition(new google.maps.LatLng(vehicle.latitude, vehicle.longitude));
          marker.info_window.setContent(vehicle['description']);
        } else {
          // The shuttle is NOT on the map.  Create it and store the marker.
          var marker_info = add_point_to_map(vehicle, map, null, true);
          var marker = marker_info[0];
          marker.info_window = marker_info[1];
        }

        //If the vehicle has been assigned an icon, use it!
        if('icon' in vehicle){
          // Build the URL for an icon, replacing :id with the icon ID
          // and :heading with the vehicle heading
          var icon_url = base_icon.replace(':id',vehicle.icon.id).replace(':heading',vehicle.latest_position.heading);
          marker.setIcon(icon_url);
        }

        marker.updated_at = now;
        shuttles[vehicle.id] = marker;
      });
      // Pass through every shuttle and delete it if it was not updated.
      $.each(shuttles, function(id, marker){
        if(marker.updated_at < now){
          marker.setMap(null);
          delete shuttles[id];
        }
      });
      $('#status').text(format_time(now) + " - OK");
    });
    return true;
  }
  function format_time(date){
    var hour=date.getHours();
    var min=date.getMinutes();
    var sec=date.getSeconds();
    var add="";

    if (min<=9) {
      min="0"+min; 
    }
    if (sec<=9) { 
      sec="0"+sec;
    }
    if (hour>12) { 
      hour=hour-12; 
      add="PM";
    } else {
      hour=hour;
      add="AM";
    }
    if (hour==12) {
      add="PM";
    }

    var output = new Array();
    output.push(hour);
    output.push(":");
    output.push(min);
    output.push(":");
    output.push(sec);
    output.push(" ");
    output.push(add);
    return (output.join(''));
  }
  function shuttle_description(vehicle){
    var buffer = new Array();
    buffer.push("<strong>");
    buffer.push(vehicle.name);
    buffer.push("</strong><br />Traveling ");
    buffer.push(vehicle.latest_position.cardinal_point);
    buffer.push(" at ");
    buffer.push(vehicle.latest_position.speed);
    buffer.push("mph.");
    return buffer.join('');
  }
  function stop_description(stop){
    var buffer = new Array();
    buffer.push("<strong>");
    buffer.push(stop.name);
    buffer.push("</strong>");
    return buffer.join('');
  }


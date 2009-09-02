var buses = new Hash();
var map;

// Call this function when the page has been loaded
function initialize() {
  map = new google.maps.Map2(document.getElementById("map_canvas"));
  map.setCenter(new google.maps.LatLng(42.73075, -73.67652), 16);
  map.setUIToDefault();
  map.setMapType(G_HYBRID_MAP);
  load_routes();
  load_stops();
  update();
  new PeriodicalExecuter(update, 10);

}

function manual_update(){
  update();
}

function refresh_time(){
  var now=new Date();
  var hour=now.getHours();
  var min=now.getMinutes();
  var sec=now.getSeconds();
  var add="";

  if (min<=9) { min="0"+min; }
  if (sec<=9) { sec="0"+sec; }
  if (hour>12) { hour=hour-12; add="PM"; }
  else { hour=hour; add="AM"; }
  if (hour==12) { add="AM"; }
  
  var output = new Array();
  output.push("Last Updated: <b>");
  output.push(hour);
  output.push(":");
  output.push(min);
  output.push(":");
  output.push(sec);
  output.push(" ");
  output.push(add);
  output.push("</b>");
  set_status(output.join(''));
}

function update(){
  var active_opt = $$('input:checked[type="radio"][name="active_opt"]').pluck('value');
  var url = STATUS_URL + "?active=" + active_opt + "&rand=" + Math.random()*1000;
  //alert(url);
  new Ajax.Request(url, {
    method:'get',
    onSuccess: function(transport){
      var json = transport.responseText.evalJSON(true);
      var expired = buses.keys();
      json.each(function(item){
        set_status("Loading " + item.position.shuttle.name);
        var point =  new GLatLng(item.position.latitude, item.position.longitude);
        var id = parseInt(item.position.shuttle.id);
        var marker = buses.get(id);
        if(marker != undefined) {
          map.removeOverlay(marker);
          buses.unset(id);
        }
        marker = createMarker(point, item.position);
        buses.set(id, marker);
        expired = expired.without(id);
        map.addOverlay(marker);
      });
      remove(expired);
      refresh_time();
     },
     onFailure: function(transport){
       set_status('Error Updating: (' + transport.status + ') ' + transport.statusText);
     },
     onCreate: function(){
       $('loading_icon').show();
     },
     onComplete: function (){
       $('loading_icon').hide();
     }
  });
  return true;
}

function shuttle_icon(rotation, width, height){
  var icon = new GIcon();
  //The default image
  icon.image = ICON_BASE_URL + "/" + rotation + ".png";
  //For older IE versions that don't like PNG
  icon.printImage = ICON_BASE_URL + "/" + rotation + ".gif";
  //For older Mozilla browsers that don't like transparency
  icon.mozPrintImage  = ICON_BASE_URL + "/" + rotation + ".jpg";

  var mid_width = width/2;
  var mid_height = height/2;

  icon.iconSize = new GSize(width, height);
  icon.iconAnchor = new GPoint(mid_width, mid_height);
  icon.infoWindowAnchor = new GPoint(mid_width, mid_height);
  return icon;
}

function createMarker(point, position) {
  var marker_icon = shuttle_icon(position.heading, parseInt(position.icon_width), parseInt(position.icon_height));
  moptions = {icon: marker_icon};
  var marker = new GMarker(point, moptions);
  GEvent.addListener(marker, "click", function() {
    marker.openInfoWindowHtml(generateShuttleHTML(position));
  });
  return marker;
}

function generateShuttleHTML(position){
  var output = new Array();
  output.push(position.shuttle.name);
  output.push("<br>Speed: ");
  output.push(position.speed);
  output.push("mph Heading: ");
  output.push(position.heading);
  output.push("&deg;");
  if((position.status != undefined) && (position.status.message.length > 0)){
    output.push("<br>Status: ");
    output.push(position.status.message);
  }

  return output.join('');
}

function generateStopHTML(stop){
  var output = new Array();
  output.push(stop.name);
  stop.routes.each(function(route){
    output.push("<br>Route: ");
    output.push(route.name);
  });

  return output.join('');
}

function remove(expired){
  expired.each(function(item){
    var marker = buses.get(item);
    map.removeOverlay(marker);
    buses.unset(item)
  });
}

function load_stops(){
  var url = STOPS_URL;
  new Ajax.Request(url, {
    method:'get',
    onSuccess: function(transport){
      var json = transport.responseText.evalJSON(true);
      var tinyIcon = new GIcon();
      tinyIcon.image = STOP_ICON_URL;
      tinyIcon.shadow = STOP_SHADOW_ICON_URL;
      tinyIcon.iconSize = new GSize(12, 20);
      tinyIcon.shadowSize = new GSize(22, 20);
      tinyIcon.iconAnchor = new GPoint(6, 20);
      tinyIcon.infoWindowAnchor = new GPoint(5, 1);
      markerOptions = { icon:tinyIcon }
      
      json.each(function(item){
        set_status("Loading Stop - " + item.stop.name)
        var point =  new GLatLng(item.stop.latitude, item.stop.longitude);
        var marker = new GMarker(point, markerOptions);
        
        GEvent.addListener(marker, "click", function() {
          marker.openInfoWindowHtml(generateStopHTML(item.stop));
        });
        map.addOverlay(marker);
      });
      refresh_time();
     },
     onFailure: function(transport){
       set_status('Error Loading Stops: (' + transport.status + ') ' + transport.statusText);
     }
  });
  return true;
}

function load_routes(){
  var url = ROUTES_URL;
  new Ajax.Request(url, {
    method:'get',
    onSuccess: function(transport){
      var json = transport.responseText.evalJSON(true);
      json.each(function(item){
        set_status("Loading Route - " + item.route.name);
        var kml_url =  item.route.kml_url;
        if(url != undefined){
          var geoXml = new GGeoXml(kml_url);
          map.addOverlay(geoXml);
        }
      });
      refresh_time();
     },
     onFailure: function(transport){
       set_status('Error Loading Routes: (' + transport.status + ') ' + transport.statusText);
     }
  });
  return true;
}

function set_status(message){
  $('status').update(message);
}

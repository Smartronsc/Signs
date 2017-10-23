<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- Copyright 2017 RichardBradleySmith.com --%>
<%@ page import="javax.servlet.RequestDispatcher" %>

<% System.out.println("web.xml " + request.getServletPath().toString() + " now being displayed for maplocations.jsp"); %>


<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="shortcut icon" href="images/wanda.png" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="css/map.css">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<style>
   html, body, #map-canvas {
      height: 100%;
      margin: 0px;
      padding: 0px
   }
   #firstHeading, #secondHeading {
   	  color: #8BD80E;
   }
      #maplocationsjsp {
      height: 6%;
   	  background: #8BD80E;
   }
</style>
</head>
<body>
<div id="logo">
	<h1><img src="images/donovan_logo.png" width="220" height="69" alt="donovan" /></h1>
</div>
 <input id='infoArray' value='${infoArray}' type='hidden'>
<script type="text/javascript">
jQuery( document ).ready(function() {
	 
google.maps.event.addDomListener(window, 'load', initialize);

function initialize() {
//if (companyKey 		!== "undefined") { console.log(getQueryVariable('key')); } 
console.log(getQueryVariable('key'));
var companyKey 		= getQueryVariable('key');
var companyLocation = new Map();
companyLocation.set('company0001', "Knox Roofing:37.054553:-122.009638:/images/knox.jpg");
companyLocation.set('company0002', "Santa Cruz Memorial:36.9904891:-122.0282342:/images/santacruzmemorial.jpg");
companyLocation.set('company0003', "Glacier Ice:36.9831444:-121.9506441:/images/glaicerice.jpg");
companyLocation.set('company0004', "Staff of Life:36.9806992:-122.0083632:/images/staff-of-life.jpg");
companyLocation.set('company0005', "Zinna's:37.0443737:-122.0269947:/images/zinnas.jpg");
companyLocation.set('company0006', "Rosie Mc Cann's:36.9734954:-122.027997:/images/rosiemaccanns.jpg");
companyLocation.set('company0007', "Viva's:36.9800083:-122.0113406:/images/vivas.jpg");
companyLocation.set('company0008', "Old School Shoes:36.9715174:-122.0279645:/images/oldschoolshoes.jpg");
companyLocation.set('company0009', "King's Paint:36.9871792:-121.9674287:/images/kingspaint.jpg");
companyLocation.set('company0010', "Roadhouse Davenport:37.0109223:-122.1960433:/images/roadhousedavenport.jpg");
companyLocation.set('company0011', "Cafe Lucio:36.9747746:-122.0214995:/images/cafelucio.jpg");
companyLocation.set('company0012', "Conner Plumbing:36.993874:-121.8483227:/images/plumbing.jpg");
companyLocation.set('company0013', "Santa Cruz Fire Dept.:36.9731359:-122.0317762:/images/santacruzfiredept.jpg");
companyLocation.set('company0014', "Kianti's:36.97195:-122.027374:/images/kiantis.jpg");
companyLocation.set('company0015', "Hog's Seafood:36.9633819:-122.0449418:/images/hogsseafood.jpg");
companyLocation.set('company0016', "Emily's:36.9697136:-122.0390834:/images/emilys.jpg");
companyLocation.set('company0017', "Plumbed Elegance:36.9760728:-121.9837917:/images/plumbedelegance.jpg");
companyLocation.set('company0018', "Warmth Company:36.9785862:-121.9010193:/images/warmthcompany.jpg");
companyLocation.set('company0019', "Santa Cruz Aptos Towing:36.9679713:-122.0057889:/images/scaptostowing.jpg");
companyLocation.set('company0020', "Jimmy Smith Plumbing:36.9890185:-121.9762936:/images/plumbing.jpg");
companyLocation.set('company0021', "Santa Cruz Metro:36.9897914:-122.0312336:/images/santacruzmetro.jpg");
companyLocation.set('company0022', "David Lyng Realtors:36.9728823:-121.9522546:/images/davidlyng.jpg");
companyLocation.set('company0023', "Aegis of Aptos:36.982308:-121.9142037:/images/ageisofaptos.jpg");
companyLocation.set('company0024', "Kennolyn Camp:37.0315684:-121.9365654:/images/kennolyncamp.jpg");
companyLocation.set('company0025', "West Marine:36.98516:-121.9834259:/images/westmarine.jpg");
companyLocation.set('company0026', "Lift Line:36.9739321:-121.9137524:/images/liftline.jpg");
companyLocation.set('company0027', "Taqueria Vallarta:36.9688553:-122.039781:/images/taqueriavallarta.png");
companyLocation.set('company0028', "Vault Gallery:36.9739948:-122.028609:/images/vaultgallery.png");
companyLocation.set('company0029', "Big Creek Lumber:36.9863925:-121.990809:/images/bigcreeklumber.jpg");
companyLocation.set('company0030', "Oakwood Memorial Park:36.9915448:-121.9872751:/images/oakwoodmemorialpark.jpg");

var mapLat      = "";
var mapLng      = "";
var imageSource = "";
bounds 		    = new google.maps.LatLngBounds();
map             = new google.maps.Map(document.getElementById('map-canvas'));
	var category  = "";
    var company   = "donovan Signs"; 
    var city      = ""; 
    var state     = ""; 
	var serverSystem  = window.location.host;
//	console.log("maplocations.jsp: " + serverSystem);

if (typeof companyKey === "undefined") {
    companyLocation.forEach(function(value, key) {
      var markerValues = value.split(":");
    //console.log(markerValues);
      companyName 	= markerValues[0];
      mapLat 		= parseFloat(markerValues[1]);
      mapLng 		= parseFloat(markerValues[2]);
      imageSource 	= markerValues[3];
     	var text      = '<div id="content">'+
          '<div id="siteNotice">'+
          '</div>'+
          '<h1 id="firstHeading">' + companyName + '</h1>'+
          '<div id="bodyContent">'+
          '<img src=' + imageSource + '>'+
          '</div>'+
          '</div>';  
      var markerId = new google.maps.Marker({
      	icon: "http://localhost:8080/images/emptystar.png", 
     	position: {lat: mapLat, lng: mapLng},
     	map: map  });
      attachText(markerId, text);
      var myLatLng = new google.maps.LatLng(markerId.position.lat(), markerId.position.lng());
      bounds.extend(myLatLng);  
    });
} else {
      value = companyLocation.get(companyKey);
      var markerValues = value.split(":");
      console.log(markerValues);
      companyName 	= markerValues[0];
      mapLat 		= parseFloat(markerValues[1]);
      mapLng 		= parseFloat(markerValues[2]);
      imageSource 	= markerValues[3];
     	var text      = '<div id="content">'+
          '<div id="siteNotice">'+
          '</div>'+
          '<h1 id="firstHeading">' + companyName + '</h1>'+
          '<div id="bodyContent">'+
          '<img src=' + imageSource + '>'+
          '</div>'+
          '</div>';  
      var markerId = new google.maps.Marker({
      	icon: "http://localhost:8080/images/emptystar.png", 
     	position: {lat: mapLat, lng: mapLng},
     	map: map  });
      attachText(markerId, text);
      var myLatLng = new google.maps.LatLng(markerId.position.lat(), markerId.position.lng());
      bounds.extend(myLatLng);  
	}


map.data.setStyle({ icon: "http://localhost:8080/images/favicon.png" }); 		
map.fitBounds(bounds);
map.panToBounds(bounds);	
   
function attachText(markerId, value) {  
   	var infowindow = new google.maps.InfoWindow({ content: value })     
    markerId.addListener('click', function() { infowindow.open(markerId.get('map'), markerId) }); 	
}    		// End of attachText  

function getQueryVariable(variable) {
    var query = window.location.search.substring(1);
    var vars = query.split('&');
    for (var i = 0; i < vars.length; i++) {
        var pair = vars[i].split('=');
        if (decodeURIComponent(pair[0]) == variable) {
            return decodeURIComponent(pair[1]);
        }
    }
    console.log('Query variable %s not found', variable);
}

}			// End of initialize 
}); 		// End of jQuery ready
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAeadI3YD63qmYsUo0mOT2Qv7tge0eqeFk&v=3.exp" defer></script>
</body>	
<div id="map-canvas"></div>		
</html>
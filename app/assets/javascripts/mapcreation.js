$(document).on('turbolinks:load', function(){

     if ($("#map").length > 0) {
        initMap();
    }

});

function onError(err) {
    console.log("What are you using, IE 7??", err);
}

function initMap() {

    var mapinfo = document.getElementById('map');
    var centralRadius
    var latitude = (mapinfo.dataset.latitude)
    var longitude = (mapinfo.dataset.longitude)
    var centerPosition = {
      lat: parseFloat(latitude),
      lng: parseFloat(longitude)
    };
    map = new google.maps.Map(document.getElementById('map'), {
      center: centerPosition,
      zoom: 13
    });

  infowindow = new google.maps.InfoWindow();
  geocoder = new google.maps.Geocoder;

  setupAutocomplete();

  listenerClick();
}

function listenerClick() {
  map.addListener('click', function(clickPosition) {
     placeMarkerAndPanTo(clickPosition.latLng, map);
   });
  }


function setupAutocomplete() {
    var input = $('#get-places')[0];
    var autocomplete = new google.maps.places.Autocomplete(input);
    autocomplete.addListener('place_changed', function() {
        var place = autocomplete.getPlace();
        if (place.geometry.location) {
            console.log(place)
            placeMarkerAndPanTo(place.geometry.location, map)
        } else {
            alert("The place has no location...?")
        }
    });
}


function placeMarkerAndPanTo(latLng, map) {
 var marker = new google.maps.Marker({
   position: latLng,
   map: map
 });
 map.panTo(latLng);
};



  /////////////////////////////////////////////
 //              API submission             //
/////////////////////////////////////////////







//
//
// function reversegeocode() {
//       var geocoder = new google.maps.Geocoder;
//       geocoder.geocode({'location': centerPosition}, function(results, status) {
//           if (status === google.maps.GeocoderStatus.OK) {
//             if (results[1]) {
//               map.setZoom(11);
//               var marker = new google.maps.Marker({
//                 position: centerPosition,
//                 map: map
//               });
//               infowindow.setContent(results[1].formatted_address);
//               infowindow.open(map, marker);
//               console.log(results)
//             } else {
//               window.alert('No results found');
//             }
//           } else {
//             window.alert('Geocoder failed due to: ' + status);
//           }
//         });
//
// };

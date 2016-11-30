var mapid = 0
var map

$(document).on('ready', function(){

  if ($("#map").length > 0) {
     initMap();

  };


});



function onError(err) {
    console.log("What are you using, IE 7??", err);
}

function initMap() {

    var mapinfo = document.getElementById('map');
    var centralRadius
    var latitude = (mapinfo.dataset.latitude)
    var longitude = (mapinfo.dataset.longitude)
    mapid = mapinfo.dataset.mapid
    console.log(mapid)

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
     console.log(clickPosition.latLng)
     reverseGeocoder(clickPosition.latLng)

   });
  }


function setupAutocomplete() {
    var input = $('#get-places')[0];
    var autocomplete = new google.maps.places.Autocomplete(input);
    autocomplete.addListener('place_changed', function() {
        var place = autocomplete.getPlace();
        if (place.geometry.location) {
            placeMarkerAndPanTo(place.geometry.location, map)
            createPlaces(place)
            $('#get-places').val("");
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

function createPlaces(place){
  console.log(place)
  console.log(map)
  console.log(mapid)
  var data_place = {

    title: place.name,
    longitude: place.geometry.location.lng() ,
    latitude: place.geometry.location.lat() ,
    rating: place.rating,
    address: place.formatted_address,
    phone: place.international_phone_number ,
    url_gmap: place.url ,
    map_id: mapid
    // category: ,
  }
  console.log(data_place)

    $.ajax({
		url: '/api/places',
		type: "POST",
		data: data_place ,
		success: function(){
  		console.log('yeah')
      appendListPlace(data_place.title)


		},
    error: function(){
			console.log("add Place Failed")
		}
	});
}

function appendListPlace(title) {
      var html = `
          <li>${title}</li>
                  `;

    $(".listPlacesMap-js").append(html)
  };







function reverseGeocoder(latlong) {
      var geocoder = new google.maps.Geocoder;
      geocoder.geocode({'location': latlong}, function(results, status) {
          if (status === google.maps.GeocoderStatus.OK) {
            if (results[1]) {
              map.setZoom(11);
              var marker = new google.maps.Marker({
                position: latlong,
                map: map
              });
              infowindow.setContent(results[1].formatted_address);
              infowindow.open(map, marker);
              console.log(results)
              searchAroundClick(latlong)
            } else {
              window.alert('No results found');
            }
          } else {
            window.alert('Geocoder failed due to: ' + status);
          }
        });

};


function searchAroundClick(latlong) {
      console.log(latlong)
      console.log(map)
      var service = new google.maps.places.PlacesService(map);
      service.nearbySearch({
        location: latlong,
          types: ['establishment'],
          rankBy: google.maps.places.RankBy.DISTANCE,

      }, resultsClick);

  }

  function resultsClick(results){
  console.log(results)
}

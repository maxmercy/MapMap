var mapid = 0;
var map;

$(document).on('ready', function() {
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
    var centerPosition = {
        lat: parseFloat(latitude),
        lng: parseFloat(longitude)
    };
    map = new google.maps.Map(document.getElementById('map'), {
        center: centerPosition,
        zoom: 14
    });
    map.setOptions({
        styles: styles
    });
    infowindow = new google.maps.InfoWindow();
    geocoder = new google.maps.Geocoder;
    mapcenterlistener(centerPosition);
    createInitialMarker()
    setupAutocomplete();
    listenerClick();
    addYourLocationButton(map);
}

function listenerClick() {
    map.addListener('click', function(clickPosition) {
        reverseGeocoder(clickPosition.latLng)
    });
}

function setupAutocomplete() {
    var input = $('#get-places')[0];
    var autocomplete = new google.maps.places.Autocomplete(input);
    autocomplete.addListener('place_changed', function() {
        var place = autocomplete.getPlace();
        if (place.geometry.location) {
            createPlaces(place)
            $('#get-places').val("");
        } else {
            alert("The place has no location...?")
        }
    });
}

var markers = [];
var iconmarker = {
                  url: '/assets/arrowmarker-default.svg',
                 };
var iconmarkerselected = {
                 url: '/assets/arrowmarker-selected.svg',
                };

function placeMarkerAndPanTo(latLng, map, timeout) {
  window.setTimeout(function() {
    var marker = new google.maps.Marker({
        animation: google.maps.Animation.DROP,
        icon: iconmarker,
        position: latLng,
        map: map
    });
      console.log(marker)

    marker.addListener('click', function() {
        if (marker.getAnimation() !== null) {
          marker.setAnimation(null);
        } else {
          marker.setAnimation(google.maps.Animation.BOUNCE);
           setTimeout(function(){ marker.setAnimation(null); }, 750);
        }

        var name = `name`;
        var address = 'an address ';
        infowindow.setContent(name + address);
        infowindow.open(map, this);
    });




}, timeout);
  map.panTo(latLng);
};

var infowindow = new google.maps.InfoWindow({
    content: contentString
  });


var contentString = 'Hello'



// Creation of the initial marker at the opening of the map
function createInitialMarker() {
  var placeinfo = document.querySelectorAll('.placeslist');
  if (placeinfo.length > 0) {
    $.each(placeinfo, function(index, toto) {
      latitude = (toto.dataset.place_lat)
      longitude = (toto.dataset.place_lng)
      place_position = {
      lat: parseFloat(latitude),
      lng: parseFloat(longitude)
      };
      latLng = place_position;
      placeMarkerAndPanTo(place_position, map, index * 100)
    });


  };
  // $.each(markers, function(index, marker) {
  //   google.maps.event.addListener(marker, 'click', toggleBounce());
  // });
}

// function toggleBounce(marker) {
//   if (marker.getAnimation() !== null) {
//     marker.setAnimation(null);
//   } else {
//     marker.setAnimation(google.maps.Animation.BOUNCE);
//         setTimeout(function(){ marker.setAnimation(null); }, 750);
//   }
// }

// button respond for recenter the map
function mapcenterlistener(centerPosition) {
    $("#btn-mapcenter").click(function() {
    map.setCenter(centerPosition );
  });
};


/////////////////////////////////////////////
//            submission             //
/////////////////////////////////////////////

function createPlaces(place) {
    var data_place = {

        title: place.name,
        longitude: place.geometry.location.lng(),
        latitude: place.geometry.location.lat(),
        rating: place.rating,
        address: place.formatted_address,
        phone: place.international_phone_number,
        url_gmap: place.url,
        map_id: mapid
            // category: ,
    }

    $.ajax({
        url: '/places.js',
        type: "POST",
        data: data_place,
        success: function(response) {
          console.log('place added')
            appendListPlace(response)
            placeMarkerAndPanTo(place.geometry.location, map)
        },
        error: function() {
            console.log("add Place Failed")
        }
    });
}

function appendListPlace(response) {
    $(".show-place-info").prepend(response.html_to_append)
};




function reverseGeocoder(latlong) {
    var geocoder = new google.maps.Geocoder;
    geocoder.geocode({
        'location': latlong
    }, function(results, status) {
        if (status === google.maps.GeocoderStatus.OK) {
            if (results[1]) {
                map.setZoom(20);
                placeMarkerAndPanTo(latlong, map);
                searchAroundClick(latlong);
            } else {
                window.alert('No results found');
            }
        } else {
            window.alert('Geocoder failed due to: ' + status);
        }
    });
};

function searchAroundClick(latlong) {
    var service = new google.maps.places.PlacesService(map);
    service.nearbySearch({
        location: latlong,
        types: ['establishment'],
        rankBy: google.maps.places.RankBy.DISTANCE,

    }, resultsClick);

}

function resultsClick(results) {
    console.log(results)
}

// #00ffe6  #20B2AA #90EE90  	#9ACD32 #FF4500 #00008B
var styles = [{
    stylers: [{
        hue: "#00008B"
    }, {
        saturation: 15
    }]
}, {
    featureType: "road",
    elementType: "geometry",
    stylers: [{
        lightness: 100
    }, {
        visibility: "simplified"
    }]
}, {
    featureType: "road",
    elementType: "labels",
    stylers: [{
        visibility: "off"
    }]
}];




// add geolocalisation button symbol on the map. to do: get my own symbol

function addYourLocationButton(map) {
    var controlDiv = document.createElement('div');

    var firstChild = document.createElement('button');
    firstChild.style.backgroundColor = '#fff';
    firstChild.style.border = 'none';
    firstChild.style.outline = 'none';
    firstChild.style.width = '28px';
    firstChild.style.height = '28px';
    firstChild.style.borderRadius = '2px';
    firstChild.style.boxShadow = '0 1px 4px rgba(0,0,0,0.3)';
    firstChild.style.cursor = 'pointer';
    firstChild.style.marginRight = '10px';
    firstChild.style.padding = '0px';
    firstChild.title = 'Your Location';
    controlDiv.appendChild(firstChild);

    var secondChild = document.createElement('div');
    secondChild.style.margin = '5px';
    secondChild.style.width = '18px';
    secondChild.style.height = '18px';
    secondChild.style.backgroundImage = 'url(https://maps.gstatic.com/tactile/mylocation/mylocation-sprite-1x.png)';
    secondChild.style.backgroundSize = '180px 18px';
    secondChild.style.backgroundPosition = '0px 0px';
    secondChild.style.backgroundRepeat = 'no-repeat';
    secondChild.id = 'you_location_img';
    firstChild.appendChild(secondChild);

    google.maps.event.addListener(map, 'dragend', function() {
        $('#you_location_img').css('background-position', '0px 0px');
    });

    firstChild.addEventListener('click', function() {
        var imgX = '0';
        var animationInterval = setInterval(function() {
            if (imgX == '-18') imgX = '0';
            else imgX = '-18';
            $('#you_location_img').css('background-position', imgX + 'px 0px');
        }, 500);
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
                var latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);


                map.setCenter(latlng);
                clearInterval(animationInterval);
                $('#you_location_img').css('background-position', '-144px 0px');
            });
        } else {
            clearInterval(animationInterval);
            $('#you_location_img').css('background-position', '0px 0px');
        }
    });

    controlDiv.index = 1;
    map.controls[google.maps.ControlPosition.RIGHT_BOTTOM].push(controlDiv);
}

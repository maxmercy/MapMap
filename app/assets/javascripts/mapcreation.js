


$(document).on('turbolinks:load', function(){


 if ($("#map").length > 0) {
        console.log('hello');
        initMap();
}



});




function initMap() {
    console.log('initmap fct')
      var map;
      var mapinfo = document.getElementById('map');
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
}

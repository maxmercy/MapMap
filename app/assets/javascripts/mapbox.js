
// personal access token will have to be hidden

$(document).on('turbolinks:load', function(){

    initMap();
});


function initMap() {

    mapboxgl.accessToken = 'pk.eyJ1IjoibWF4bWVyY3kiLCJhIjoiY2l3MXplMTRwMDhibDJ0cGNrY2QzbmZoayJ9.Ybq0sAYRjcEwrjeoMbP0Pg';
    var map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v9',
        center: [ 2.154, 41.39], // starting position
        zoom: 10 // starting zoom
    });
    map.addControl(new mapboxgl.NavigationControl());


};

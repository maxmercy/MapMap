$(document).on('ready', function() {

    if ($("#btn-mapname").length > 0) {
      mapnamelistener();
    };

});


function mapnamelistener() {
  $("#btn-mapname").click(function() {
      $('.js-map-name').fadeToggle(200);
      $('#btn-mapname').fadeToggle(200);
      $('.js-map-name-form').fadeToggle(200);

  });
};

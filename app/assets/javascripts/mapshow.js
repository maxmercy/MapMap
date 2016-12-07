$(document).on('ready', function() {

    if ($("#btn-mapname").length > 0) {
      mapnamelistener();
      custommodalclick();
      mapplaceaction();
    };

});


function mapnamelistener() {
  $("#btn-mapname").click(function() {
      $('.js-map-name').fadeToggle(200);
      $('#btn-mapname').fadeToggle(200);
      $('.js-map-name-form').fadeToggle(200);

  });
};


function custommodalclick() {
    $('#emailsubmit').click(function() {
      console.log('ore')
        $('#myModal').modal('hide');
    });
};


function mapplaceaction() {
  
box-map-place

}

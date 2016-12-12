$(document).on('ready', function() {

    if ($("#btn-mapname").length > 0) {
      mapnamelistener();
      checkEmptyFormSubmission()
    };

});


function mapnamelistener() {
  $("#btn-mapname").click(function() {
        // $('.js-map-name').fadeToggle(200);
      $('#btn-mapname').fadeToggle(200);
      $('.js-map-name-form').fadeToggle(200);

  });
};


function checkEmptyFormSubmission(){
    $('#emailsubmit').click(function(event) {
        $('.js-empty-warning').filter(function(){
          return !this.value
        }).addClass('empty-input-warning');
        console.log('hello')

        if ($('form').find('input.empty-input-warning').length > 0) {
            event.preventDefault();
            $('.empty-warning-div').show()
            $('form *').removeClass('empty-input-warning')
        }
        else {
            $('#myModal').modal('hide');
        }
    });
};

$(document).ready(function() {

  $(document).on('click', '#segment-picker-submit-button', function(event) {
    event.preventDefault();
    var target = $(event.target);
    var form = target.closest('form');
    var url = form.attr('action');
    var data = form.find('select[name="segment_name"]').val();
    var segmentDetails = $(".container-dashboard");

    $.ajax({
      url: url,
      data: { segment_name: data },
      success: function(data) {
        segmentDetails.replaceWith(data);
      }, error: function(xhr) {
        console.log(xhr);
      }
    });
  });

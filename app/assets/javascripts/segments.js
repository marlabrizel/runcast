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
        var segmentDataDiv = $("#pr-segment-details");
        console.log(segmentDataDiv, segmentDataDiv.data());
        var centerLat = segmentDataDiv.data('startLat');
        var centerLong = segmentDataDiv.data('startLong');

        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 13,
          center: {lat: centerLat, lng: centerLong},
          mapTypeId: google.maps.MapTypeId.TERRAIN
        });

        var path = segmentDataDiv.data('polyline');
        var decodedSets = google.maps.geometry.encoding.decodePath(path)

        var activityCoordinates = decodedSets;

        var activity = new google.maps.Polyline({
          path: activityCoordinates,
          geodesic: true,
          strokeColor: '#FF0000',
          strokeOpacity: 1.0,
          strokeWeight: 2
        });

        activity.setMap(map);
      }, error: function(xhr) {
        console.log(xhr);
      }
    });
  });
});

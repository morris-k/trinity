function initMap() {
	var latLng = new google.maps.LatLng(30.109435,-93.748006);
	var mapOpts = {
		center: latLng,
		zoom: 14
	}

	var map = new google.maps.Map(document.getElementById('map'), mapOpts);

	var marker = new google.maps.Marker({
	    position: latLng,
	    title:"Trinity Baptist Church of Orange"
	});

	var infowindow = new google.maps.InfoWindow({
    content: "<div><h5>Trinity Baptist Church of Orange</h5><p>1819 North 16th Street</br>Orange, TX</p></div>"
  });

	marker.setMap(map);
	infowindow.open(map, marker);

	marker.addListener('click', function() {
	    infowindow.open(map, marker);
	  });
}
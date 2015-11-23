


// create the initial directions object, from which the layer
// and inputs will pull data.

function addDirections() {

	var geojson = [
		{
			"type": "Feature",
			"geometry": {
				"type": "Point",
				"coordinates": [-77.031952, 38.913184]
			},
			"properties": {
				"marker-color": "#3ca0d3",
				"marker-size": "large",
			}
		},
		{
			"type": "Feature",
			"geometry": {
				"type": "Point",
				"coordinates": [-122.413682, 37.775408]
			},
			"properties": {
				"marker-color": "#63b6e5",
				"marker-size": "large",
			}
		}
		];

	L.mapbox.accessToken = 'pk.eyJ1IjoiaXNvbWR1cm0iLCJhIjoiY2loNThoYXh3MDBoNnRza290enF6YWNobiJ9.gm2YkuDsq--gEyl1YGCL_g';

	var map = L.mapbox.map('map', 'mapbox.streets', {
	    zoomControl: false,
	}).setView([40, -74.50], 9);

	var directions = L.mapbox.directions({
	    profile: 'mapbox.walking'
	}).setOrigin(geojson[0]).setDestination(geojson[1]);

	var directionsLayer = L.mapbox.directions.layer(directions)
	    .addTo(map);

	var directionsInputControl = L.mapbox.directions.inputControl('inputs', directions)
	    .addTo(map);

	var directionsErrorsControl = L.mapbox.directions.errorsControl('errors', directions)
	    .addTo(map);

	var directionsRoutesControl = L.mapbox.directions.routesControl('routes', directions)
	    .addTo(map);

	var directionsInstructionsControl = L.mapbox.directions.instructionsControl('instructions', directions)
	    .addTo(map);

	    // var geocoder = L.mapbox.geocoder('mapbox.places');

	    // geocoder.query()

};

$(document).ready(function(){
	addDirections();
});
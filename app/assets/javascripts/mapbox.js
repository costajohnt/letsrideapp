


// create the initial directions object, from which the layer
// and inputs will pull data.

function addDirections() {

	// var geojson = [
	// 	{
	// 		"type": "Feature",
	// 		"geometry": {
	// 			"type": "Point",
	// 			"coordinates": [-77.031952, 38.913184]
	// 		},
	// 		"properties": {
	// 			"marker-color": "#3ca0d3",
	// 			"marker-size": "large",
	// 		}
	// 	},
	// 	{
	// 		"type": "Feature",
	// 		"geometry": {
	// 			"type": "Point",
	// 			"coordinates": [-122.413682, 37.775408]
	// 		},
	// 		"properties": {
	// 			"marker-color": "#63b6e5",
	// 			"marker-size": "large",
	// 		}
	// 	}
	// 	];

	// 	console.log(geojson);


	L.mapbox.accessToken = 'pk.eyJ1IjoiaXNvbWR1cm0iLCJhIjoiY2loNThoYXh3MDBoNnRza290enF6YWNobiJ9.gm2YkuDsq--gEyl1YGCL_g';

	var map = L.mapbox.map('map', 'mapbox.streets', {
	    zoomControl: false,
	}).setView([40, -74.50], 9);

	var geocoder = L.mapbox.geocoder('mapbox.places');

	var test = $('#start_location').text();

    var testone = $('#end_location').text();

    var geojson;

    var geojsone;
	
	function showMapStart(err, data) {

    geojson = [
		{
			"type": "Feature",
			"geometry": {
				"type": "Point",
				"coordinates": [data.latlng[1], data.latlng[0]]
			},
			"properties": {
				"marker-color": "#3ca0d3",
				"marker-size": "large",
			}
		}
		];

		console.log(geojson);
    };

    function showMapEnd(err, data) {


    	geojsone = [
		{
			"type": "Feature",
			"geometry": {
				"type": "Point",
				"coordinates": [data.latlng[1], data.latlng[0]]
			},
			"properties": {
				"marker-color": "#3ca0d3",
				"marker-size": "large",
			}
		}
		];

		console.log(geojsone);
    };

    var begin = geocoder.query(test, showMapStart);

    var end = geocoder.query(testone, showMapEnd);

    function timeout() {


   var json = [geojson, geojsone];

   console.log(json);

    var directions = L.mapbox.directions({
	    profile: 'mapbox.cycling'
	}).setOrigin(geojson[0]).setDestination(geojsone[0]);

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

	    console.log('hellooooo', geojson);

	map.setView([geojson[0].geometry.coordinates[1], geojson[0].geometry.coordinates[0]], 12);

};

setTimeout(timeout, 3000)



};

$(document).ready(function(){
	addDirections();
});
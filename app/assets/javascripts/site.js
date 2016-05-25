$(document).on("ready", function(){
	$("#reservation-button").on("click", function(event) {
		event.preventDefault();
		console.log("Let's start!")
		checkReservation();
	})

function checkReservation() {
	timeParams = $('input[name="time"]').val();
	nameParams = $('input[name="name"]').val();
	startParams = $('input[name="start"]').val();
	destinationParams = $('input[name="destination"]').val();
	console.log(timeParams);
	console.log(nameParams);
	console.log(startParams);
	console.log(destinationParams);

	$.ajax({
		type: "post",
		url: "/api/reservation",
		data: {time: timeParams, name: nameParams, start: startParams, destination: destinationParams},
		success: function(data) {
			console.log("Yes: ", data);
		},
		error: function(error) {
			console.log("Error: ", error);
		}
	})
}

})
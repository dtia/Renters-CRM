function apply(prop_id) {
	$.ajax({
		    url: "/property/apply",
		    type: "POST",
			data: { prop_id: prop_id },
		    success: function(resp){
				console.log('Application posted');
				if (resp) {
					for (var i=0; i<resp.length; i++) {
					}
				}
			}
	});
}
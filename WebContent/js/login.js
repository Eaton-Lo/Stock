$(document).ready(function() {
	$('.message a').click(function() {
		$('form').animate({
			height : "toggle",
			opacity : "toggle"
		}, "slow");
	});

	$('createBtn').click(function() {
		var actionUrl = projectPath+"/v1/users";
		var methodType = "POST";
		var dataObj = null;
		var asyncType = true;
		ajaxHelper(actionUrl, methodType, dataObj, asyncType,function(data){

		});
	});
	
	$('loginBtn').click(function() {
		var actionUrl = projectPath+"/v1/users";
		var methodType = "POST";
		var dataObj = null;
		var asyncType = true;
		ajaxHelper(actionUrl, methodType, dataObj, asyncType,function(data){

		});
	});
})

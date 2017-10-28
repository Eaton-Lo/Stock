$(document).ready(function() { 
	getUserInformation();
	
	$('#submitBtn').click(function() {
		var userId = sessionStorage.getItem('userId');
		var actionUrl = projectPath+"/v1/users/"+userId;
		var methodType = "PUT";
		var asyncType = true;
		var dataObj = {
				"first_name":$('#firstName').val(),
				"last_name":$('#lastName').val(),
				"user_password":$('#password').val()
		};
		
		if($('#firstName').val().length <= 0){
			alert("please enter your first name");
		}else if($('#lastName').val().length <= 0){
			alert("please enter your last name");
		}else if($('#password').val().length <= 0){
			alert("please enter your password");
		}else{
			ajaxHelper(actionUrl, methodType, dataObj, asyncType,function(data){
				alert("update success!");
			});
		}
	});
	
	function getUserInformation(){
		var userId = sessionStorage.getItem('userId');
		var actionUrl = projectPath+"/v1/users/"+userId;
		var methodType = "GET";
		var asyncType = true;
		var dataObj = null;
		ajaxHelper(actionUrl, methodType, dataObj, asyncType,function(data){
			console.log(data);
			var user = data.users;
			$('#userId').val(user.id);
			$('#email').val(user.user_email);
			$('#firstName').val(user.first_name);
			$('#lastName').val(user.last_name);
			$('#password').val(user.user_password);
		});
	}
})



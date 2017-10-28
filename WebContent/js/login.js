$(document).ready(function() {
	
	var actionUrl = projectPath+"/v1/users";
	var methodType = "POST";
	var asyncType = true;

	$('.message a').click(function() {
		$('form').animate({
			height : "toggle",
			opacity : "toggle"
		}, "slow");
	});

	$('#createBtn').click(function() {
		
		var dataObj = {
				"first_name":$('#create_firstName').val(),
				"last_name":$('#create_lastName').val(),
				"user_email":$('#create_email').val(),
				"user_password":$('#create_password').val(),
				"action":"create"
		};
		
		if($('#create_firstName').val().length <= 0){
			alert("please enter your first name");
		}else if($('#create_lastName').val().length <= 0){
			alert("please enter your last name");
		}else if($('#create_password').val().length <= 0){
			alert("please enter your password");
		}else if($('#create_email').val().length <= 0){
			alert("please enter your email");
		}else{
			ajaxHelper(actionUrl, methodType, dataObj, asyncType,function(data){
				//存在前端storage上並導頁
				saveUserInfo(data);
			});
		}
	});
	
	$('#loginBtn').click(function() {

		var dataObj = {
				"user_email":$('#login_email').val(),
				"user_password":$('#login_password').val(),
				"action":"login"
		};
		
		if($('#login_email').val().length <= 0){
			alert("please enter your email");
		}else if($('#login_password').val().length <= 0){
			alert("please enter your password");
		}else{
			ajaxHelper(actionUrl, methodType, dataObj, asyncType,function(data){
				//存在前端storage上並導頁
				saveUserInfo(data);
			});
		}
	});
	
	function saveUserInfo(data){
		console.log(data);
		var user = data.users;
		sessionStorage.setItem('userId', user.id);
		sessionStorage.setItem('userName', user.first_name);
		sessionStorage.setItem('userPassword', user.user_password);
		sessionStorage.setItem('userEmail', user.user_email);
		alert("hello "+user.first_name+" !");
		window.location = "index.jsp";
	}
})

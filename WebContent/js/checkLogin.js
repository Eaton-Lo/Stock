$(document).ready(function() {
	var userName = sessionStorage.getItem('userName');
	if(userName == null){
		alert("please login first");
		window.location = "login.jsp";
	}
})

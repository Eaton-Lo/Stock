
<header id="header" class="header">
	<div id="logo"><a href="index.jsp">Stock App</a></div>
	<div id="account">user</div>
	<script type="text/javascript">
		var userName = sessionStorage.getItem('userName');
		$('#account').text(userName);
		$("#account").hover(function() {
			$(this).text("logout");
			$(this).click(function() {
				window.location = "login.jsp";
			})
		}, function() {
			$(this).text(userName);
		});
	</script>
</header>
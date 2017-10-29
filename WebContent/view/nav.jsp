
<nav>
	<ul class="nav">
		<li><a href="profile.jsp">Profile</a></li>
		<li><a href="portfolio.jsp">Portfolio</a><span id="portfolioSpan"></span></li>
		<li><a href="stock_screener.jsp">Stock Screener</a></li>
		<li><a href="setting.jsp">Setting</a></li>
	</ul>
	<script type="text/javascript">
		var actionUrl = projectPath + "/v1/users/"+sessionStorage.getItem('userId')+"/user_portfolios";
		var methodType = "get";
		var asyncType = false;
		var dataObj = null;
		//insert portfolio
		ajaxHelper(actionUrl, methodType, dataObj, asyncType, function(data) {
			console.log(data);
			var html = "";
			var portfoliosArray = data.user_portfolios;
			$.each(portfoliosArray, function(key, value) {
				html += "<li><a href='portfolio.jsp?id="+value.id+"'>"+value.portfolios_name+"</a></li>"
			});		
			$('#portfolioSpan').append("<ul>"+html+"</ul>");
		});
	</script>
</nav>
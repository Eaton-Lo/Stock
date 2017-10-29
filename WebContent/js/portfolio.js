$(document).ready(function() {
	var portfolioId = QueryString.id;
	var symbolArray;
	var symbolSelectArray = new Array();
	
	getSymbols();
	
	//from nav li onclick
	if(portfolioId != undefined){
		var actionUrl = projectPath+"/v1/users/"+sessionStorage.getItem('userId')+"/user_portfolios/"+portfolioId;
		var methodType = "get";
		var asyncType = false;
		var dataObj = null;
		ajaxHelper(actionUrl, methodType, dataObj, asyncType,function(data){
			console.log(data);
			var user_portfolios = data.user_portfolios;
			$('#PortfolioName').text(" : "+user_portfolios.portfolio_name);
		});
	}

	$('.datatable_s').DataTable();

	$('#symbolBtn').on('click',function(){
		$( "#dialog-info" ).dialog({
		      resizable: false,
		      height: "auto",
		      width: "auto",
		      modal: true,
		      title:"Choose"
		  });
	})
	
	$('#createNewPortfolioBtn').click(function(){
	    var portfolio = prompt("Please enter the name of your new portfolio:");
	    if (portfolio == null || portfolio == "") {
	    	alert("Please enter portfolio name!");
	    } else {
			var actionUrl = projectPath+"/v1/users/"+sessionStorage.getItem('userId')+"/user_portfolios";
			var methodType = "post";
			var asyncType = false;
			var dataObj = {
					"user_id":sessionStorage.getItem('userId'),
					"portfolio_name":portfolio
			};
	    	//insert portfolio
			ajaxHelper(actionUrl, methodType, dataObj, asyncType,function(data){
				location.reload();
			});
	    }
	})

	$( "#datepicker" ).datepicker();
	
	function getSymbols(){
		var actionUrl = projectPath+"/v1/symbols";
		var methodType = "GET";
		var asyncType = false;
		var dataObj = null;
		ajaxHelper(actionUrl, methodType, dataObj, asyncType,function(data){
			console.log(data);
			symbolArray = data.symbols;
			$.each(symbolArray, function(key, value) {
				symbolSelectArray.push(value.symbol+" -- "+value.symbol_name +" -- " +value.exchange);
			});		
			$("#symbol").autocomplete({
				source : symbolSelectArray,
				select: function( event, ui ) {
					alert( ui);
					$( "#symbol_name" ).val( ui.item.value );
					
					$( "#dialog-info" ).dialog({
					      resizable: false,
					      height: "auto",
					      width: 500,
					      modal: true,
					      title:"Choose"
					 });
				}
				
			});
		});
	}
})

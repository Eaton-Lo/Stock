$(document).ready(function() {
	var portfolioId = QueryString.id;
	var symbolArray;
	var symbolSelectArray = new Array();

	getSymbols();
	$('#datepicker').datepicker({ dateFormat: 'yy/mm/dd' });

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
		$('#addSymbolDiv').css('display','');
		$('#cashDiv').css('display','');

		getTransactions();
	}else{
		$('.datatable_s').DataTable();
	}

	$('.cashTypeBtn').on('click',function(){
		$('#cashTypeDiv').css('display','');
		$('#cashTypeTitle').text($(this).text()+":");
	})
	
	$('#cancelBtn').click(function(){
		$('#cashTypeDiv').css('display','none');
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

	
	$('#submitBtn').click(function(){
		var actionUrl = projectPath+"/v1/transactions";
		var methodType = "post";
		var asyncType = false;
		var dataObj = {
				"user_id":sessionStorage.getItem('userId'),
				"portfolio_id":portfolioId,
				"transaction_type":$('select[name=type]').val(),
				"transaction_datetime":$('#datepicker').val(),
				"balance":"1",
				"symbol":$('#symbol_name').attr('data-symbol'),
				"shares":$('#shares').val(),				
				"stock_price":$('#price').val(),
				"stock_country":"",
				"description":$('#notes').val()
		};
    	//create transactions
		ajaxHelper(actionUrl, methodType, dataObj, asyncType,function(data){
			location.reload();
		});
	})
		
	$('#symbolBtn').click(function(){
		$('#dialog-info').dialog({
		      resizable: false,
		      height: "auto",
		      width: 500,
		      modal: true,
		      title:"Choose"
		 });	
	})
	
	function getSymbols(){
		var actionUrl = projectPath+"/v1/symbols";
		var methodType = "GET";
		var asyncType = false;
		var dataObj = null;
		ajaxHelper(actionUrl, methodType, dataObj, asyncType,function(data){
			console.log(data);
			symbolArray = data.symbols;
			$.each(symbolArray, function(key, value) {
				var labelStr = value.symbol+" -- "+value.symbol_name +" -- " +value.exchange;
				var item = {
						"label":labelStr,
						"value":value.symbol
				}
				symbolSelectArray.push(item);
			});		
			$("#symbol").autocomplete({
				source : symbolSelectArray,
				select: function( event, ui ) {
					$('#symbol_name').val(ui.item.label);
					$('#symbol_name').attr('data-symbol',ui.item.value);
				}
			});
		});
	}
	
	function getTransactions(){
		var actionUrl = projectPath+"/v1/transactions?userId="+sessionStorage.getItem('userId')+"&portfolioId="+portfolioId;
		var methodType = "get";
		var asyncType = false;
		var dataObj = null
    	//get transactions
		ajaxHelper(actionUrl, methodType, dataObj, asyncType,function(data){
			var transactions = data.transactions;
			$.each(transactions, function( index, item ) {
				var trClass = index/2 == 0?trClass = 'odd':trClass = 'even';
				var transaction_id = item.id;
				var symbolName = item.symbol_name;
				var symbol = item.symbol;
				var shares = item.shares;
				var transactionType = item.transaction_type;
				var stockPrice = item.stock_price;
				var balance = item.symbol;
				var note = item.description;
				var html = '<tr id="'+transaction_id+'" role="row" class="'+trClass+'">';
					html += '<td class="">'+symbolName+'</td>';
					html += '<td class="">'+symbol+'</td>';
					html += '<td class="">'+transactionType+'</td>';
					html += '<td class="">'+shares+'</td>';
					html += '<td class="">'+stockPrice+'</td>';
					html += '<td class="">'+balance+'</td>';
					html += '<td class="">'+note+'</td>';
//					html += '<td class=""><div class="btn btn-info detailBtn">Detail</div></td>';
					html += '</tr>';
				$('tbody').append(html);
				
				$('.detailBtn').click(function(){

				})
			});
			
			$('.datatable_s').DataTable();
		});
	}
})

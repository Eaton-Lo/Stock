$(document).ready(function() {
	var symbolArray;
	var symbolSelectArray = new Array();
	getSymbols();
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
				source : symbolSelectArray
			});
		});
	}
})

$(document).ready(function() { 
	$('.connector_title').text(xmlParser("display_name"));

	getList();
	
	function getList(){
		var actionUrl = projectPath+"/v1/services";
		var methodType = "GET";
		var dataObj = null;
		var asyncType = true;
		
		//只處理發送回來完成的訊息做顯示 錯誤判斷由public.js 做處理
//		ajaxHelper(actionUrl, methodType, dataObj, asyncType,function(data){
//			var serviceList = data.services;
//			
//			$.each(serviceList, function( index, serviceObj ) {
//				var trClass = index/2 == 0?trClass = 'odd':trClass = 'even';
//				var serviceId = serviceObj.id;
//				var serviceName = serviceObj.display_name;
//				var connectorServiceId = serviceObj.external_service_id;
//				var emmaServiceId = serviceObj.EmmaConnectorServiceId;
//				console.log("index : "+index +", connectorId : "+ connectorServiceId + ", emmaServiceId : "+emmaServiceId);
//				var html = '<tr id="'+serviceId+'" role="row" class="'+trClass+'">';
//					html += '<td class="">'+connectorServiceId+'</td>';
//					html += '<td class="">'+serviceName+'</td>';
//					html += '<td><a href="returnCodePage.jsp?serviceId='+serviceId+'" class="btn btn-info doGet">設定</a>&nbsp;';
//					html += '<td><a style="background-color:#777;border-color:#777" href="addService.jsp?serviceId='+serviceId+'&action=edit" class="btn btn-primary doGet">編輯</a>&nbsp;';
//					html += '<a href="sendBroadcast.jsp?serviceId='+serviceId+'&emmaServiceId='+emmaServiceId+'" class="btn btn-primary sendBroadcastBtn">發送廣播</a>&nbsp';
//					html += '<a href="broadcastHistory.jsp?serviceId='+serviceId+'" class="btn btn-success doGet">歷史訊息</a>&nbsp';
//					html += '<button value='+serviceId+' class="btn btn-danger btn-delete doGet">刪除</button>&nbsp;</td>';
//					html += '</tr>';
//				$('tbody').append(html);
//			});
//			
//			
//			$('.loading').remove();
			datatableInit();
//		});
	}

	function datatableInit(){
		$('.btn-delete').click(function(){
			if(confirm("確定要刪除嗎？"))
			{
				var serviceId = $(this).val();
				ajaxHelper(projectPath+"/v1/services/"+serviceId, "DELETE", null, true,function(data){
					alert("刪除成功！");
					location.reload();
				});
			}
		});	
		$('.datatable_s').DataTable({
			"language": {
				"lengthMenu": "顯示 _MENU_ 筆資料",
				"zeroRecords": "沒有相符的搜尋結果",
				"info": "顯示 _START_ 至 _END_ 筆，共 _TOTAL_ 筆",
				"infoEmpty": "無資料",
				"infoFiltered": "（從 _MAX_ 筆資料過濾）",
				"paginate": {
					"next": "下一頁",
					"previous": "前一頁"
				},
				"sSearch": "<i class='fa fa-search'></i> 搜尋：",
			},
			"dom": 'Tlfr<"clear">iptip<"clear">',
			"tableTools": {
				"sSwfPath": "../lib/copy_csv_xls_pdf.swf",
				"aButtons": [{
					"sExtends":    "copy",
					"sButtonText": "複製表格",
					"sDiv":        "copy",
					"oSelectorOpts": { filter: 'applied', order: 'current' }
				}, {
					"sExtends":    "xls",
					"sButtonText": "匯出成 Excel",
					"sTitle": $('input[name="dt-title"]').val(),
					"sDiv":        "xls",
					"oSelectorOpts": { filter: 'applied', order: 'current' }
				}]
			}
		});
		
	}
})



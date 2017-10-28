//讀一些預設值
readConfig();
var projectPath = "/"+xmlParser("project_path");
var host = xmlParser("emma_host");
var path = xmlParser("base_connector_path");
var configXml;

var token = "";
//這可以直接拿get上的url parse 用法可以參考index.js
var QueryString = function () {
	  var query_string = {};
	  var query = window.location.search.substring(1);
	  var vars = query.split("&");
	  for (var i=0;i<vars.length;i++) {
	    var pair = vars[i].split("=");
	    if (typeof query_string[pair[0]] === "undefined") {
	      query_string[pair[0]] = decodeURIComponent(pair[1]);
	    } else if (typeof query_string[pair[0]] === "string") {
	      var arr = [ query_string[pair[0]],decodeURIComponent(pair[1]) ];
	      query_string[pair[0]] = arr;
	    } else {
	      query_string[pair[0]].push(decodeURIComponent(pair[1]));
	    }
	  } 
	  return query_string;
}();

//畫面上所有ajax 發送前可以做處理
$( document ).ajaxSend(function(e, xhr,options) {
//	if(sessionStorage.getItem('token') != null){
//		token = sessionStorage.getItem('token');
//	}
    //xhr.setRequestHeader("Authorization","token="+token);   
});

//畫面上所有ajax 完成後可以做處理
$(document).ajaxComplete(function (event, xhr, settings) {
//	if((xhr.status == 200 && xhr.responseJSON != undefined) || xhr.status == 302){
//		var data = JSON.parse(xhr.responseText);
//		if(data.ret_code=="9998"){
//			postMessage("access_denied");
//		}else{
//			setToken();
//		}
//	}else{
//		setToken();
//	}
});

function setToken(){
	if(token != undefined){
		var decoded = jwt_decode(token);
		sessionStorage.setItem('userName',decoded['data'].displayname); 
		if(sessionStorage.getItem('token') != token){
			sessionStorage.setItem('token',token);     
		}
	}
}

function readConfig()
{
    var rawFile = new XMLHttpRequest();
    rawFile.open("GET","../config/connectorInfo.xml", false);
    rawFile.onreadystatechange = function ()
    {
        if(rawFile.readyState === 4)
        {
            if(rawFile.status === 200 || rawFile.status == 0)
            {
            	configXml = rawFile.responseText;
            }
        }
    }
    rawFile.send(null);
}

function xmlParser(tagName){
    var dom = new DOMParser();
    var xmlParser = dom.parseFromString(configXml,"text/xml");
    var nodeVal = xmlParser.getElementsByTagName(tagName)[0].childNodes[0].nodeValue;
    
    if(tagName == "emma_host" && nodeVal == "http://localhost:8080"){
    	nodeVal = "";
    }
    
    return nodeVal;
}

/*
 * 共用ajax
 * parameters : actionUrl -> 對應url
 * 				method    -> 使用類型(crud,get,post,put,patch,delete)
 * 				dataObj   -> 傳送物件
 * 				asyncType -> 同步或異步傳送
 * 				callback  -> 執行結束後回傳資訊  
 * 	return    : 回傳物件型態{ "success/failure" : data }
 * 
 * */
function ajaxHelper(actionUrl, methodType, dataObj, asyncType, callback){
	var returnObj = {};
	var parameters = null;
	if(dataObj != null){
		parameters = JSON.stringify(dataObj)
	}
	$.ajax({
		url: actionUrl,
		type: methodType,
		async: asyncType,
		dataType : "json",
		data : parameters
	}).done(function(data){
		if(data.ret_code == "0000"){
			callback(data);
		}else{
			alert(data.ret_msg);
		}
//		console.log
	}).fail(function(data){
		alert(data.responseJSON["ret_msg"]);
		console.log(data);
	});
}

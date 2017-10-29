$(document).ready(function() { 
	var temp = [ 1, 2 ];
	$.each(temp, function(index, val) {
		var trClass = index/2 == 0?trClass = 'odd':trClass = 'even';
		var html = '<tr id="" role="row" class="'+trClass+'">';
		html += '<td class="">' + "A" + '</td>';
		html += '<td class="">' + "B" + '</td>';
		html += '<td class="">' + "C" + '</td>';
		html += '<td class="">' + "D" + '</td>';
		html += '<td class="">' + "E" + '</td>';
		html += '</tr>';
		$('tbody').append(html);
	});
	$('.datatable_s').DataTable();
	
	// stock search bar
	
	var dataObj = {
			"user_email":$('#login_email').val(),
			"user_password":$('#login_password').val(),
			"action":"login"
	};
	
	
	
	  var stocks = [
	      "ActionScript",
	      "AppleScript",
	      "Asp",
	      "BASIC",
	      "C",
	      "C++",
	      "Clojure",
	      "COBOL",
	      "ColdFusion",
	      "Erlang",
	      "Fortran",
	      "Groovy",
	      "Haskell",
	      "Java",
	      "JavaScript",
	      "Lisp",
	      "Perl",
	      "PHP",
	      "Python",
	      "Ruby",
	      "Scala",
	      "Scheme"
	    ];
	  

		ajaxHelper(actionUrl, methodType, dataObj, asyncType,function(data){
			console.log(data);
			
			stocks = data;			
			
		});
	
	  
	  
	  
	  
	  
	    $( "#tags" ).autocomplete({
	      source: stocks
	    });
	
})








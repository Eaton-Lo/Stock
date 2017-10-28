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
})



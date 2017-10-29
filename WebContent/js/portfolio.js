$(document).ready(function() {

	$('.datatable_s').DataTable();

	var stocks = [ "ActionScript", "AppleScript", "Asp",
			"BASIC", "C", "C++", "Clojure", "COBOL",
			"ColdFusion", "Erlang", "Fortran", "Groovy",
			"Haskell", "Java", "JavaScript", "Lisp", "Perl",
			"PHP", "Python", "Ruby", "Scala", "Scheme" ];

	$("#symbol").autocomplete({
		source : stocks
	});
	

})

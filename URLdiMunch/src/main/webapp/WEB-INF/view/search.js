$('#ajaxsearch').on('input focus', function(e) {
	let value = $('#ajaxsearch').val();
    
    $("#searchResult").html("");
    hideSearchResult();
    
    if (value && value.length >0){
		let url = "SearchAjaxServlet?cerca="+value;
	    $.get( url , function( data ) {
	  		$("#searchResult").html("");
	  		
	  		if (data && data.length > 0){
		
				for (i = 0; i < min(data.length,5); i++){
					let elem = data[i];
					$("#searchResult").append("<div class=\"searchableitem\" data-cod=\""+elem.idProdotto+"\"" +
							" onclick=\"openSearch(this)\"><div class=\"item-name\">"+elem.nome+"</div></div>");
				}
				$("#searchResult").show();
				
			} else {
				$("#searchResult").append("<div class=\"searchableitem\">Nessun elemento trovato</div>");
				$("#searchResult").show();
			}
		});
	}
    
});

/* Manage hover on results */
var hovered = false;

$("#searchResult").bind("mouseover",function() {
    hovered = true;
}).bind("mouseout",function() {
    hovered = false;
});

function showSearchResult(){
	$("#searchResult").show();
}

function hideSearchResult(){
	if (!hovered)
	$("#searchResult").hide();
}

function min(a,b){
	if ( a <= b) return a;
	return b
}

function openSearch(elem){
	let codice = $(elem).data("cod");
	let url = "SearchServlet?cerca="+codice; 
	$.get( url , function( data ){
		window.location.href = 'detailsSearch.jsp';
	});
}
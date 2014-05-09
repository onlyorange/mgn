(function($) {
	$.fn.PavOffCavasmenu = function(opts) {
		// default configuration
		var config = $.extend({}, {
			opt1: null,
			text_warning_select:'Please select One to remove?',
			text_confirm_remove:'Are you sure to remove footer row?',
			JSON:null
		}, opts);
		// main function
		function DoSomething(e) {
			
		}

	 
		// initialize every element
		this.each(function() {  
			var $btn = $('#mainnav .btn-navbar');
			
			$("body").append( '<section id="off-canvas-nav"><nav class="pavo-mainnav" ></nav></sections>' );
				
			var $nav = $("#off-canvas-nav .pavo-mainnav"); 
	 	 	$nav.append( '<div id="off-canvas-button"><span class="icon-remove-sign"></span></div>' );

	 	 	var $menucontent = $($btn.data('target')).find('.megamenu').clone();
			$nav.append( $menucontent );
 			$('html').addClass ('off-canvas');
			$("#off-canvas-button").click( function(){
				$btn.click();	
			} ); 
			$btn.toggle( function(){
				$("body").addClass('off-canvas-active').removeClass("off-canvas-inactive");
			}, function(){
				$("body").removeClass('off-canvas-active').addClass("off-canvas-inactive");
			} );

		});
		return this;
	};
	
})(jQuery);


$(window).ready( function(){
/* Fix Search */
	/* Search */
	$('#search_mobile .button-search').bind('click', function() {
		url = $('base').attr('href') + 'index.php?route=product/search';
		var search = $('#search_mobile input[name=\'search1\']').attr('value');
		if (search) {
			url += '&search=' + encodeURIComponent(search);
		}
		location = url;
	});	
	$('#search_mobile input[name=\'search1\']').bind('keydown', function(e) {
		if (e.keyCode == 13) {
			url = $('base').attr('href') + 'index.php?route=product/search';			 
			var search = $('#search_mobile input[name=\'search1\']').attr('value');			
			if (search) {
				url += '&search=' + encodeURIComponent(search);
			}			
			location = url;
		}
	});
	
	/*  Fix First Click Menu */
		$(document.body).on('click', '#mainnav [data-toggle="dropdown"], #off-canvas-nav [data-toggle="dropdown"]' ,function(){ 
		if(!$(this).parent().hasClass('open') && this.href && this.href != '#'){
			window.location.href = this.href;
		}

	});

	$("#mainnav").PavOffCavasmenu();

	$(".quantity-adder .add-action").click( function(){
		if( $(this).hasClass('add-up') ) {  
			$("[name=quantity]",'.quantity-adder').val( parseInt($("[name=quantity]",'.quantity-adder').val()) + 1 );
		}else {
			if( parseInt($("[name=quantity]",'.quantity-adder').val())  > 1 ) {
				$("input",'.quantity-adder').val( parseInt($("[name=quantity]",'.quantity-adder').val()) - 1 );
			}
		}
	} );
	
	$(window).scroll(function() {
        if($(this).scrollTop() > 250){
            $('#goTop').stop().animate({
                bottom: '20px'    
                }, 500);
        }
        else{
            $('#goTop').stop().animate({
               bottom: '-100px'    
            }, 500);
        }
    });
    $('#goTop').click(function() {
        $('html, body').stop().animate({
           scrollTop: 0
        }, 500, function() {
           $('#goTop').stop().animate({
               bottom: '-100px'    
           }, 500);
        });
    });

} );
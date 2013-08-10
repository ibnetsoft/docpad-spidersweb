$ ->
	# Disable certain links in docs
	$("[href^=#none]").click (e) ->
	 e.preventDefault()

	$("a[data-toggle=popover]").popover().click (e) ->
  		e.preventDefault()
	
	$("a[data-toggle=tooltip]").tooltip()

	$ ->
	$(".carousel").carousel
	interval: 5000
	pause: "hover"

	$(window).scroll ->
		if $(this).scrollTop() > 100
			$(".scrollup").fadeIn()
		else
			$(".scrollup").fadeOut()

	$(".scrollup").click ->
		$("html, body").animate
			scrollTop: 0
			, 600
			false

	$(".font-resize").jfontsize
	  btnMinusClasseId: "#jfontsize-m"
	  btnDefaultClasseId: "#jfontsize-d"
	  btnPlusClasseId: "#jfontsize-p"

	jQuery ($) ->
	  $(".widget-feed").rss "http://markquery.com/feed",
	    limit: 5
	    effect: "slideFast"
	    layoutTemplate: "<ul class=\"media-list\">{entries}</ul>"
	    entryTemplate: "<li class=\"media\"><a class=\"pull-left\" href=\"{url}\"><img class=\"media-object media-thumbnail\" src=\"{teaserImageUrl}\"></a><div class=\"media-body\"><h4 class=\"media-heading\"><a href=\"{url}\">{title}</a></h4></div></li>"


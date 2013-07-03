$ ->
	# Disable certain links in docs
	$("[href^=#none]").click (e) ->
	 e.preventDefault()

	$ ->
	$window = $(window)
	# make code pretty
	window.prettyPrint and prettyPrint()

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

	$("a[data-toggle=popover]").popover().click (e) ->
  		e.preventDefault()
	
	$("a[data-toggle=tooltip]").tooltip()

	$(".font-resize").jfontsize
	  btnMinusClasseId: "#jfontsize-m"
	  btnDefaultClasseId: "#jfontsize-d"
	  btnPlusClasseId: "#jfontsize-p"

	jQuery ($) ->
	  $(".rss-feed").rss "http://markquery.github.io/atom.xml",
	    limit: 10
	    effect: "slideFast"
	    layoutTemplate: "<ul class=\"module-asset-list\">{entries}</ul>"
	    entryTemplate: "<li class=\"module-asset\"><a href=\"{url}\"><img class=\"module-asset-object\" src=\"{teaserImageUrl}\"></a><div class=\"module-asset-body\"><h6><a href=\"{url}\">{title}</a></h6><p><a href=\"{url}\">{shortBodyPlain}</a></p></div></li>"

	jQuery ($) ->
	  $(".menu-feed").rss "http://markquery.github.io/atom.xml",
	    limit: 5
	    effect: "slideFast"
	    layoutTemplate: "<ul class=\"menu-asset-list mobile-wrap\">{entries}</ul>"
	    entryTemplate: "<li class=\"menu-asset\"><a href=\"{url}\"><img class=\"menu-asset-object\" src=\"{teaserImageUrl}\"></a><div class=\"menu-asset-body\"><h6><a href=\"{url}\">{title}</a></h6></div></li>"

renderContent = (doc, siteUrl) ->
  rendered = doc.get('contentRenderedWithoutLayouts')
  rendered = rendered.replace('src="/', "src=\"#{siteUrl}/")

  text '<![CDATA[\n'
  text rendered
  text ']]>\n'

anEntry = (document) ->
  tag 'entry', ->
    title '<![CDATA[ ' + document.get('title') + ' ]]>'
    tag 'link', href: "#{@site.url}#{document.get('url')}"
    tag 'link', rel: 'alternate', type: 'text/html', href: "#{@site.url}#{document.get('url')}"
    tag 'updated', "#{document.get('ctime')}"
    tag 'id', "#{@site.url}#{document.get('url')}"
    tag 'summary', "#{document.get('excerpt')}"
    tag 'content', type: 'html', -> renderContent document, @site.url

text '<?xml version="1.0" encoding="utf-8"?>\n'
tag 'feed', xmlns: 'http://www.w3.org/2005/Atom', ->
  title '<![CDATA[ ' + @site.title + ' ]]>'
  tag 'link', href: "#{@site.url}/atom.xml", rel: 'self'
  tag 'link', href: @site.url
  tag 'updated', @document.date.toISOString()
  tag 'id', @site.url
  for name of @authors
    author = @authors[ name ]
    tag 'author', ->
      tag 'name', author.name
      tag 'email', author.email

  i=0
  @getCollection('documents').findAll({isPaged:true}).forEach (document) ->
    i++
    if i < 11 and document.get('contentRenderedWithoutLayouts')
      anEntry document


marked = require 'marked'

exports.createIntroRenderer = ->
  wrap = (func, name) ->
    return ->
      return if this.__intro then func.apply(this, arguments) else ""

  hr = ->
    this.__intro = false
    return ""

  renderer = new marked.Renderer()
  renderer.__intro = true

  fields = 'code blockquote html heading hr list listitem paragraph table ' +
    'tablerow tablecell strong em codespan br del link image'

  for field in fields.split ' '
    if typeof renderer[field] == 'function'
      renderer[field] = if field == 'hr' then hr else wrap renderer[field], field

  return renderer

exports.createRenderer = ->
  renderer = new marked.Renderer()
  renderer.__found = false

  originalHr = renderer.hr
  renderer.hr = ->
    if this.__found
      originalHr.apply(this, arguments)
    else
      this.__found = true
      ""

  return renderer

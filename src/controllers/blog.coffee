marked = require 'marked'
posts = require '../lib/posts'

PAGE_TITLE       = 'page.title'
DISQUS_SHORTNAME = 'integrations.disqus.shortname'

exports.index = (req, res) ->
  posts.list (err, postList) ->
    res.render 'blog/index',
      pageTitle: CONFIG.get PAGE_TITLE
      posts:     postList

exports.showPost = (req, res) ->
  p = req.params
  name = if p[0].substr(-1) == '/' then p[0].substr(0, p[0].length - 1) else p[0]
  postId = "#{p.year}-#{p.month}-#{p.day}_#{name}"
  posts.get postId, (err, postData) ->
    res.render 'blog/post',
      pageTitle:       CONFIG.get PAGE_TITLE
      post:            postData
      disqusShortname: CONFIG.get DISQUS_SHORTNAME

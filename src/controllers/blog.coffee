marked = require 'marked'
posts = require '../lib/posts'

PAGE_TITLE       = 'page.title'

exports.index = (req, res) ->
  posts.list (err, postList) ->
    res.render 'blog/index',
      pageTitle: CONFIG.get PAGE_TITLE
      posts:     postList

exports.showPost = (req, res) ->
  p = req.params
  postId = "#{p.year}-#{p.month}-#{p.day}_#{p[0]}"
  posts.get postId, (err, postData) ->
    res.render 'blog/post',
      pageTitle:       CONFIG.get PAGE_TITLE
      post:            postData

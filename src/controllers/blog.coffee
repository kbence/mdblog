marked = require 'marked'
posts = require '../lib/posts'

exports.index = (req, res) ->
  posts.list (err, postList) ->
    console.log postList
    res.render 'blog/index', posts: postList

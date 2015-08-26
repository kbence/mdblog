fs              = require 'fs'
async           = require 'async'
InternetMessage = require 'internet-message'
HeaderParse     = require 'header-parse'

POSTS_ROOT = "#{__dirname}/../../posts"
POST_FILENAME_FORMAT = /(\d{4}-\d{2}-\d{2})_(.*)\.md/

loadPost = (filename, cb) ->
  match = filename.match /(\d{4}-\d{2}-\d{2})_(.*)\.md/

  if match
    urlDate = match[1].replace(/-/g, '/')
    urlTitle = match[2]
    fs.readFile "#{POSTS_ROOT}/#{filename}", (err, content) ->
      msg = HeaderParse.extractHeaderBlock content
      cb null, {
        url: "/#{urlDate}/#{urlTitle}.html",
        title: msg.headers['Title']
      }

exports.list = (cb) ->
  fs.readdir POSTS_ROOT, (err, content) ->
    postFiles = (post for post in content when post.match POST_FILENAME_FORMAT)
    posts = async.map postFiles, loadPost, cb

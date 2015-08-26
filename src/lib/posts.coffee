fs              = require 'fs'
async           = require 'async'
InternetMessage = require 'internet-message'
HeaderParse     = require 'header-parse'
marked          = require 'marked'

POSTS_ROOT = "#{__dirname}/../../posts"
POST_FILENAME_FORMAT = /(\d{4}-\d{2}-\d{2})_(.*)\.md/

loadPost = (filename, options, cb) ->
  match = filename.match /(\d{4}-\d{2}-\d{2})_(.*)\.md/

  withContent = options.withContent || false

  if match
    urlDate = match[1].replace(/-/g, '/')
    urlTitle = match[2]
    fs.readFile "#{POSTS_ROOT}/#{filename}", (err, content) ->
      if err
        return cb err

      msg = HeaderParse.extractHeaderBlock content

      entry = {
        url: "/#{urlDate}/#{urlTitle}.html",
        title: msg.headers['Title']
      }

      if withContent
        entry.content = marked(msg.body)

      cb null, entry
  else
    cb "File name '#{filename}' doesn't look like a post."

loadPostMetadata = (filename, cb) ->
  loadPost filename, { withContent: false }, cb

exports.list = (cb) ->
  fs.readdir POSTS_ROOT, (err, content) ->
    postFiles = (post for post in content when post.match POST_FILENAME_FORMAT)
    posts = async.map postFiles, loadPostMetadata, cb

exports.get = (postId, cb) ->
  loadPost "#{postId}.md", { withContent: true }, cb

blog = require './controllers/blog'

exports.initialize = (app) ->
  app.get '/', blog.index

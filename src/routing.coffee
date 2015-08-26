blog = require './controllers/blog'

exports.initialize = (app) ->
  app.get '/', blog.index
  app.get '/:year/:month/:day/*.html', blog.showPost

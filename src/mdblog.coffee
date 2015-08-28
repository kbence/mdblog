express        = require 'express'
lessMiddleware = require 'less-middleware'
routing        = require './routing'
{Config}       = require './lib/config'

try
  config = require '../config.json'
catch e
  config = {}

global.CONFIG = new Config config

app = express()
app.set 'view engine', 'jade'
app.set 'views', "#{__dirname}/views"

app.use lessMiddleware("#{__dirname}/public")
app.use express.static("#{__dirname}/public")

routing.initialize app
app.listen process.env.PORT || 8080

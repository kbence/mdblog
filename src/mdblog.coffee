express        = require 'express'
routing        = require './routing'
lessMiddleware = require 'less-middleware'

app = express()
app.set 'view engine', 'jade'
app.set 'views', "#{__dirname}/views"

app.use lessMiddleware("#{__dirname}/public")
app.use express.static("#{__dirname}/public")

routing.initialize app
app.listen process.env.PORT || 8080

express = require 'express'
routing = require './routing'

app = express()
app.set 'view engine', 'jade'
app.set 'views', "#{__dirname}/views"

routing.initialize app
app.listen process.env.PORT || 8080

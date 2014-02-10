express = require 'express'
helpers = require './helpers.js'
app = express()

app.use express.static __dirname + '/public'

app.get '/', helpers.

app.listen '4000'
console.log 'running on 120.0.0.1 listening to port 4000'
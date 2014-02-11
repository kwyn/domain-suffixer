express = require 'express'
helpers = require './helpers.js'
app = express()

app.configure =>
  app.use express.static __dirname + '/public'
  app.use '/whois', helpers.whois
  app.use express.bodyParser()
  app.use express.methodOverride()
  return

app.listen '4000'
console.log 'running on 120.0.0.1 listening to port 4000'
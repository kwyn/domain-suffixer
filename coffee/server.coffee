express = require 'express'
app = express()

app.get '/hello.txt', (req, res) =>
  res.send 'Hello World!'

app.use express.static __dirname + '/public'

app.listen '4000'
console.log 'running on 120.0.0.1 listening to port 4000'
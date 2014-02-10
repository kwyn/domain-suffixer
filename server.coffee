express = require 'express'
app = express()

app.get '/hello.txt', (req, res) =>
  res.send 'Hello World!'

app.listen '4000'
console.log 'running on 120.0.0.1 listening to port 4000'
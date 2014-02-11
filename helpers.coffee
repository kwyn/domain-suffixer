# Firebase = require 'firebase'
# myDataRef = new firebase 'incandescent-fire-1839.firebaseIO.com'
http = require 'http'
util = require 'util'
exports.whois = (req, res, next) ->
  console.log "who is request! #{req.method} #{util.inspect(req.query, false, null)}"
  url = "http://whois.net/whois/#{req.query['url']}"
  http.get url, (response) =>
    return res.send response
    console.log "got response #{response.text}"
  .on 'error', (e) =>
    console.log "got error #{e}" 
request = require 'request'

module.exports = (robot) ->
  robot.hear /^(.*)$/i, (msg) ->
    console.log "receive: #{msg.match[1]}"
    request "http://api.tiqav.com/search.json?q=#{encodeURIComponent msg.match[1]}", (err, res, body) ->
      img = msg.random JSON.parse body
      msg.send "http://img.tiqav.com/#{img.id}.#{img.ext}"

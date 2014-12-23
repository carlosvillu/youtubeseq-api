express = require 'express'
app = express()

debug = require('debug')('youtubeseq-api-home-debug')

app.get '/', (req, res, next) ->
  res.send 'Hello world!'

module.exports = app

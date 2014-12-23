express = require 'express'
app = express()

debug = require('debug')('youtubeseq-api-debug')
config = require './config'

app.use require('cors')()
app.use '/api/sequences', require('./routers/sequences')

app.use ( req, res, next ) ->
  res.status( 404 ).json error: 404, msg: "Not Found"

app.listen config.get('PORT'), ->
  debug "App Up and Running in #{config.get('PORT')}"

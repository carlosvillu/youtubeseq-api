express = require 'express'
app = express()
{YoutubeFactory, SequenceForVideoFactory} = require 'youtubeseq-domain'

debug = require('debug')('youtubeseq-api-sequences-debug')

app.get '/', (req, res, next) ->
  Promise.resolve( req.query.title || YoutubeFactory.youtubeRepository( 'API' ).titleById( req.query.id ) ).then (title) ->
    SequenceForVideoFactory.service( YoutubeFactory.youtubeRepository( 'API' ) )
      .execute(SequenceForVideoFactory.request( title )).done (results) ->
        res.json results

module.exports = app

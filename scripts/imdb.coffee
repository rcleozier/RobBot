# Description:
#   Get movie information from IMDB. Pugbomb for terrible movies
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   imdb {movie}
#
# Author:
#   Robbins Cleozier

module.exports = (robot) ->
  robot.hear /(imdb) (.*)/i, (msg) ->
    getMovieDetails msg, msg.match[2], (movieInfo) ->
      msg.send movieInfo

  getMovieDetails = (msg, query, cb) ->
    msg.http('http://www.omdbapi.com/?t=' + query)
      .get() (err, res, body) ->
        movie = JSON.parse(body)
        if Object.keys(movie).length > 2
          movieInfo  = movie.Title  + ' Released: ' + movie.Released + ' Directed By: ' + movie.Director + ' IMDB:' + movie.imdbRating + '\n' + movie.Plot
          
          if (movie.Metascore) < 30
            msg.http("http://pugme.herokuapp.com/bomb?count=" + 5)
            .get() (err, res, body) ->
              msg.send pug for pug in JSON.parse(body).pugs
              msg.send "Pugbomb for requesting such as terrible movie as " + movie.Title

          cb movie.Poster
          cb movieInfo
        else
          cb 'No movie found...'

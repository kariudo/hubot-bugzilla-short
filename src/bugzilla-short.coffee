# Description
#   A hubot script to return short links to bugzilla bugs when mentioned
#
# Configuration:
#   HUBOT_BITLY_TOKEN
#   HUBOT_BUGZILLA_URL (i.e. https://bugzilla.example.com)
#
# Commands:
#   bug [query] - responds with shortened link for bug
#   bug[query] - responds with shortened link for bug
#   bz [query] - responds with shortened link for bug
#   bz[query] - responds with shortened link for bug
#
# Author:
#   hhorsman[kariudo@gmail.com]

module.exports.domain = domain = process.env.HUBOT_BUGZILLA_URL
module.exports.getLink = getLink = (bug) -> "#{domain}/show_bug.cgi?id=#{bug}"

module.exports = (robot) ->
  robot.hear /\b(?:(?:bug)|(?:bz)) ?(\d+)\b/i, (msg) ->
    bugNo = msg.match[1]
    searchUrl = getLink bugNo
    robot.http("https://api-ssl.bitly.com/v3/shorten")
      .query
        access_token: process.env.HUBOT_BITLY_TOKEN
        longUrl: searchUrl
        format: "json"
      .get() (err, res, body) ->
        response = JSON.parse body
        msg.send if response.status_code is 200 then ':bug: ' + response.data.url else "Something has gone wrong, I blame Jay."

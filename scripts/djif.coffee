# Description:
#   Post a random GIF with  #djif <search>
#
# Dependencies:
#   None
#
# Commands:
#   #djif <search> - Post a random <search> GIF
#
# Authors:
#   EtienneLem

module.exports = (robot) ->
  robot.hear /#djif\s+(.*)?$/i, (msg) ->
    data = { search: msg.match[1] }
    robot.http('http://djif.herokuapp.com/hipchat')
      .query(data)
      .post() (err, res, body) ->
        msg.send JSON.parse(body).text

request = require('request').defaults({
  strictSSL: false
})

module.exports = (robot) ->
  api = "https://api.apigw.smt.docomo.ne.jp/dialogue/v1/dialogue/?APIKEY=#{process.env.DOCOMO_API_KEY}"

  robot.hear /(.*)/, (msg) ->
    query = msg.match[1]
    request.post(api, body: JSON.stringify({utt: query}), (error, response, body) ->
      msg.reply "#{JSON.parse(body).utt}"
    )

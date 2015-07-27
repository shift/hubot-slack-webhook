# Description
#   Allows Hubot to accept Slack Incoming Webhooks for when you've ran out of free integrations.
#
# Author:
#   Vincent Palmer <vincent@chartmogul.com>

module.exports = (robot) ->
  robot.router.post '/slack/webhook', (req, res) ->
  try
    data = JSON.parse(req.body.payload)
    room = data.channel
    from = data.username
    icon = data.icon_emoji
    text = data.text
  catch
    data = req.body
    room = data.channel
    from = data.username
    icon = data.icon_url
    text = data.attachments[0].fallback

    robot.logger.info "Data: #{data}."
    robot.logger.info "Data Payload: #{data.payload}."
    room = data.channel
    from = data.username
    icon = data.icon_emoji
    text = data.text
    robot.logger.info "Slack-Webhook parsed: #{room}, #{from}, #{icon}, #{text}."
    robot.messageRoom room, text

    attachment =
      channel: "hubot-testing"
      username: "#{from}"
      icon_url: "https://slack.global.ssl.fastly.net/9fa2/img/services/hubot_128.png"
      content:
        fallback: "#{text}"
        title: "New Signup"
        title_link: "https://app.chartmogul.com/monitor/accounts"
        text:"#{text}"
        image_url: "https://assets-cdn.github.com/images/modules/logos_page/GitHub-Logo.png"
        color: "#111111"

    robot.emit 'slack-attachment', attachment
    res.send 'OK'


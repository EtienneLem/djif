# Djif
Posts GIF with `#djif <search>` in your Slack channels and HipChat rooms.<br>
It was, at first, a port of [Bold](https://twitter.com/bold)’s [GifBot](https://github.com/bold/GifBot). Give them a shout-out!

## HipChat
Add [hubot-djif](https://www.npmjs.org/package/hubot-djif) to your Hubot `package.json` file
```json
…
"dependencies": {
  "hubot":         "2.7.3",
  "hubot-scripts": "2.5.13",
  "hubot-hipchat": "2.6.4",
  "hubot-djif":    "0.1.2"
}
…
```

Then add `["hubot-djif"]` to your `external-scripts.json` file.<br>
Restart/deploy Hubot. He will be listening to `#djif <search>`.

![Djif HipChat](https://cloud.githubusercontent.com/assets/436043/2965892/677be1ce-db01-11e3-8af0-e8824905e162.png)

## Slack
Add an [Outgoing Webhook](https://your_domain.slack.com/services/new/outgoing-webhook) integration to your Slack account.
<p align="center">
  <img src="https://cloud.githubusercontent.com/assets/436043/2957504/53e6416a-daa0-11e3-8bf4-d08f3120c219.png">
</p>

Bonus: [Here’s the avatar that we use for the bot](https://s3-us-west-2.amazonaws.com/slack-files2/bot_icons/2014-05-12/2335833467_48.png).

![Djif Slack](https://cloud.githubusercontent.com/assets/436043/2965855/66d15520-db00-11e3-9fdd-31a69c0f3c3d.png)

## Development
You’ll need a `.env` file with the `GIPHY_API_KEY` variable. You can use this one for development purpose, this is the public API key. It is however subject to rate limit constraints, see [https://github.com/giphy/GiphyAPI#access-and-api-keys](https://github.com/giphy/GiphyAPI#access-and-api-keys).
```
GIPHY_API_KEY=dc6zaTOxFJmzC
```

Run the server with `foreman start`.

<p align="center">
  <a href="http://giphy.com">
    <img src="https://cloud.githubusercontent.com/assets/436043/2952524/63c5005c-da3d-11e3-87b0-e1c49ac51c1d.gif">
  </a>
</p>

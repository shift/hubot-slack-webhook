# hubot-slack-webhook

Allows Hubot to accept Slack Incoming Webhooks for when you've ran out of free integrations.

See [`src/slack-webhook.coffee`](src/slack-webhook.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-slack-webhook --save`

Then add **hubot-slack-webhook** to your `external-scripts.json`:

```json
[
  "hubot-slack-webhook"
]
```

## Sample Interaction

```
user1>> hubot hello
hubot>> hello!
```

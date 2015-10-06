# Babble

An endpoint for a Slack Slash Command for translation. You can use it to setup
a Slash Command like `/t Hola, mundo` to return translations of text from
Google Translate.

## Deployment

Deploy to Heroku with a standard config, and the Procfile should just work.
You'll need to add your `SLACK_TOKEN` (from the Slash Command integration
page), and a `TRANSLATE_TOKEN` (from the Google Translate API).

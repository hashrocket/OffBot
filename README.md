# 🔌 🤖 OFFBOT

[![Build Status](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2Fhashrocket%2FOffBot%2Fbadge&style=for-the-badge)](https://actions-badge.atrox.dev/hashrocket/OffBot/goto)

A friendly slack bot for announcing upcoming Hashrocket observed holidays and
time off - communicating those in a timely manner makes us better consultants !

Based on the Hashrocket Employee Handbook.

## Testing

The best way to verify the integration is to run the app locally, talking to
Slack.

You can change the channel in the `Announcer` in `lib/offbot/announcer.rb`, but
keep in mind the channel must have the app installed to send messages.
`#chicago` channel is a good test channel with fewer members to get spammed
than `#general`.

You'll need the api token from Heroku, it can be looked up via `heroku config`.

To run the announcer locally:

``` bash
% SLACK_API_TOKEN=xxx bundle exec rake announce
```

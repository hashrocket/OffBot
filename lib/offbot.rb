# frozen_string_literal: true

require 'dotenv'
require 'slack-ruby-bot'

require_relative './offbot/off_days'
require_relative './offbot/message_builder'
require_relative './offbot/announcer'
require_relative './offbot/duration_parser'
require_relative './offbot/bot'
require_relative './offbot/server'

Dotenv.load

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
end

# OffBot
module OffBot
end

OffBot::Bot.run if ARGV == ['start']

# frozen_string_literal: true
module OffBot
  # server for automatic reminders of upcoming off days
  class Announcer
    def self.announce(channel: '#testing', message:)
      slack_client.chat_postMessage(
        channel: channel,
        text: message,
        as_user: true
      )
    end

    def self.slack_client
      @client ||= Slack::Web::Client.new
    end
  end
end

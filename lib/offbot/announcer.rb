# frozen_string_literal: true
module OffBot
  # server for automatic reminders of upcoming off days
  class Announcer
    def self.announce(channel: '#general', message: nil)
      message = default_message unless message

      return if message.empty?

      slack_client.chat_postMessage(
        channel: channel,
        text: message,
        as_user: true
      )
    end

    def self.default_message
      message_builder.build_message(
        message_start: <<~EOF.strip,
        <@here> Happy Monday! here is the holiday schedule for this week and next week
        EOF
        from_date: Date.today,
        to_date: 2.weeks.from_now,
        empty_text: ''
      )
    end

    def self.message_builder
      MessageBuilder
    end

    def self.slack_client
      @client ||= Slack::Web::Client.new
    end
  end
end

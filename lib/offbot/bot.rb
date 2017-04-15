# frozen_string_literal: true
module OffBot
  # actual bot - allows asking for upcoming off days
  class Bot < SlackRubyBot::Bot
    match(/upcoming holidays|vacation|time off|holidays/) do |client, data, _match|
      message = MessageBuilder.message(
        from_date: Date.today,
        to_date: 2.weeks.from_now
      )

      client.say(text: message, channel: data.channel)
    end
  end
end

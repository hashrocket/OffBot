# frozen_string_literal: true

module OffBot
  # actual bot - allows asking for upcoming off days
  class Bot < SlackRubyBot::Bot
    match(/offbot (?:.*(?:holidays|vacation|time off)).*(?<duration>\d+)\s(?<time_unit>days?|weeks?|months?).*/) do |client, data, match|
      begin
        to_date = OffBot::DurationParser.relative_duration_to_date(
          match[:duration],
          match[:time_unit]
        )
      rescue OffBot::InvalidDurationError
        client.say(text: "Sorry I can't understand your message", channel: data.channel)
        return
      end

      message = MessageBuilder.build_message(
        message_start: 'I found some holidays :sharkdance:',
        from_date: Date.today,
        to_date: to_date,
        empty_text: 'Sorry, No holidays found for the time span you asked about.'
      )

      client.say(text: message, channel: data.channel)
    end

    match(/^offbot .*(?:holidays|vacation|time off).*/) do |client, data|
      message = MessageBuilder.build_message
      client.say(text: message, channel: data.channel)
    end
  end
end

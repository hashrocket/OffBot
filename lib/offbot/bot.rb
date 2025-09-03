# TODO: refactor this to use `slack-ruby-client`
# frozen_string_literal: true

# module OffBot
#   # actual bot - allows asking for upcoming off days
#   class Bot < SlackRubyBot::Bot
#     match(/(upcoming holidays|vacation|time off).*\?$/) do |client, data|
#       message = MessageBuilder.build_message(
#         message_start: 'There are some holidays coming up :sharkdance:, please let your client know today',
#         from_date: Date.today,
#         to_date: 2.weeks.from_now
#       )
#
#       client.say(text: message, channel: data.channel)
#     end
#   end
# end

# frozen_string_literal: true
module OffBot
  # builds messages based on OffDays and date range
  class MessageBuilder
    DEFAULT_MSG_START = 'Holidays this week and next week'
    NO_HOLIDAYS_FOUND = 'No holidays found for this week or next week 😔'

    def self.message(message_start: DEFAULT_MSG_START, from_date:, to_date:, empty_text: NO_HOLIDAYS_FOUND)
      holidays = off_days_calc.days_off(from_date, to_date).map do |holiday|
        "#{holiday[:date]}: #{holiday[:name]}"
      end.join("\n")

      if holidays.size.positive?
        "#{message_start}:\n#{holidays}"
      else
        empty_text
      end
    end

    def self.off_days_calc
      @off_days ||= OffDays.new
    end
  end
end

# frozen_string_literal: true

require "holidays"

module OffBot
  # show holidays for a date range
  class OffDays
    HASHROCKET_HOLIDAYS = [
      "New Year's Eve", # in custom_holidays.yaml
      "New Year's Day",
      "Memorial Day",
      "Independence Day",
      "Labor Day",
      "Thanksgiving",
      "Thanksgiving Friday", # in custom_holidays.yaml
      "Christmas Eve",
      "Christmas Day"
    ].freeze

    def initialize
      # NOTE: there's an issue where if the first thing we do with Holidays is
      # `load_custom`, then _only_ the custom holidays will be returned in
      # subsequent calls to `between`. So this `Holidays.on` loads the default
      # us holidays into memory, then `load_custom` merges our custom holidays
      # on top of the default. ¯\_(ツ)_/¯
      Holidays.on(Date.today, :us)

      Holidays.load_custom(File.expand_path("./custom_holidays.yaml"))
    end

    def days_off(from_date, to_date)
      Holidays
        .between(from_date, to_date, :us, :informal)
        .select { |holiday| HASHROCKET_HOLIDAYS.include?(holiday[:name]) }
    end
  end
end

# frozen_string_literal: true

module OffBot
  class InvalidDurationError < StandardError; end
  # Parses duration text into date
  module DurationParser
    def self.relative_duration_to_date(duration, time_unit)
      d = duration.to_i
      plural_unit = time_unit.pluralize
      %w[days weeks months years].include?(plural_unit) || raise(InvalidDurationError)
      eval("#{d}.#{time_unit}.from_now.to_date")
    end
  end
end

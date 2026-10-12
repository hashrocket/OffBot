# frozen_string_literal: true

require "spec_helper"

RSpec.describe OffBot::OffDays do
  describe "#hashrocket_holidays" do
    it "returns Hashrocket Holidays" do
      from_date = Date.new(2016, 12, 29)
      to_date = Date.new(2017, 12, 29)
      holidays = described_class.new.days_off(from_date, to_date)

      expect(holidays).to match_array([
        {
          date: Date.new(2016, 12, 31),
          name: "New Year's Eve",
          regions: array_including(:us)
        },
        {
          date: Date.new(2017, 1, 1),
          name: "New Year's Day",
          regions: array_including(:us)
        },
        {
          date: Date.new(2017, 5, 29),
          name: "Memorial Day",
          regions: array_including(:us)
        },
        {
          date: Date.new(2017, 7, 4),
          name: "Independence Day",
          regions: array_including(:us)
        },
        {
          date: Date.new(2017, 9, 4),
          name: "Labor Day",
          regions: array_including(:us)
        },
        {
          date: Date.new(2017, 11, 23),
          name: "Thanksgiving",
          regions: array_including(:us)
        },
        {
          date: Date.new(2017, 11, 24),
          name: "Thanksgiving Friday",
          regions: array_including(:us)
        },
        {
          date: Date.new(2017, 12, 24),
          name: "Christmas Eve",
          regions: array_including(:us)
        },
        {
          date: Date.new(2017, 12, 25),
          name: "Christmas Day",
          regions: array_including(:us)
        }
      ])
    end

    it "returns Christmas Eve, which the holidays gem does not define" do
      holidays = described_class.new.days_off(Date.new(2026, 12, 21), Date.new(2026, 12, 27))

      expect(holidays.map { |holiday| [holiday[:date], holiday[:name]] }).to eq([
        [Date.new(2026, 12, 24), "Christmas Eve"],
        [Date.new(2026, 12, 25), "Christmas Day"]
      ])
    end
  end
end

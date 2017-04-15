# frozen_string_literal: true
require 'spec_helper'

RSpec.describe OffBot::OffDays do
  describe '#hashrocket_holidays' do
    it 'returns Hashrocket Holidays' do
      from_date = Date.new(2016, 12, 29)
      to_date   = Date.new(2017, 12, 29)
      holidays  = described_class.new.days_off(from_date, to_date)
      expected  = [
        {
          date: Date.new(2016, 12, 31),
          name: "New Year's Eve",
          regions: [:us]
        },
        {
          date: Date.new(2017, 1, 1),
          name: "New Year's Day",
          regions: [:us]
        },
        {
          date: Date.new(2017, 1, 16),
          name: 'Martin Luther King, Jr. Day',
          regions: [:us]
        },
        {
          date: Date.new(2017, 2, 20),
          name: "Presidents' Day",
          regions: [:us]
        },
        {
          date: Date.new(2017, 4, 14),
          name: 'Good Friday',
          regions: [:us]
        },
        {
          date: Date.new(2017, 5, 29),
          name: 'Memorial Day',
          regions: [:us]
        },
        {
          date: Date.new(2017, 7, 4),
          name: 'Independence Day',
          regions: [:us]
        },
        {
          date: Date.new(2017, 9, 4),
          name: 'Labor Day',
          regions: [:us]
        },
        {
          date: Date.new(2017, 11, 23),
          name: 'Thanksgiving',
          regions: [:us]
        },
        {
          date: Date.new(2017, 11, 24),
          name: 'Thanksgiving Friday',
          regions: [:us]
        },
        {
          date: Date.new(2017, 12, 25),
          name: 'Christmas Day',
          regions: [:us]
        }
      ]

      expect(holidays).to eq(expected)
    end
  end
end

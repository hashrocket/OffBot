
# frozen_string_literal: true
require 'spec_helper'

RSpec.describe OffBot::MessageBuilder do
  describe '.message' do
    it 'returns message contaning all holidays for January' do
      from_date = Date.new(2017, 1, 1)
      to_date   = Date.new(2017, 1, 31)
      message   = described_class.build_message(
        message_start: 'test',
        from_date: from_date,
        to_date: to_date
      )

      expect(message).to eq(<<~MESSAGE.strip)
      test:
      Sunday, 01 Jan 2017: New Year's Day
      Monday, 16 Jan 2017: Martin Luther King, Jr. Day
      MESSAGE
    end
  end
end

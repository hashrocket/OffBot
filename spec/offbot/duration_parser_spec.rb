require 'spec_helper'

RSpec.describe OffBot::DurationParser do
  describe '.relative_duration_to_date' do
    it 'parses 1 day from now' do
      date = described_class.relative_duration_to_date('1', 'day')
      expect(date).to eq(1.day.from_now.to_date)
    end

    it 'parses 6 days from now' do
      date = described_class.relative_duration_to_date('6', 'days')
      expect(date).to eq(6.days.from_now.to_date)
    end

    it 'parses 1 month from now' do
      date = described_class.relative_duration_to_date('1', 'month')
      expect(date).to eq(1.month.from_now.to_date)
    end

    it 'parses 6 months from now' do
      date = described_class.relative_duration_to_date('6', 'months')
      expect(date).to eq(6.month.from_now.to_date)
    end

    it 'returns an InvalidDurationError when does duration is not valid' do
      expect do
        described_class.relative_duration_to_date('6', 'centuries')
      end.to raise_error(OffBot::InvalidDurationError)
    end
  end
end

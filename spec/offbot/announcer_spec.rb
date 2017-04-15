# frozen_string_literal: true
require 'spec_helper'

RSpec.describe OffBot::Announcer do
  describe '.announce' do
    it 'sends a message to slack client' do
      slack_client = double(:slack_client, chat_postMessage: nil)
      allow(described_class).to receive(:slack_client) { slack_client }

      described_class.announce(channel: '#test', message: 'hello world')

      expect(slack_client).to have_received(:chat_postMessage)
    end
  end
end

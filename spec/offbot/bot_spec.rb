require 'spec_helper'

RSpec.describe OffBot::Bot do
  def app
    OffBot::Bot.instance
  end

  subject { app }

  it_behaves_like 'a slack ruby bot'
end

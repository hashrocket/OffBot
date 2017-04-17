# frozen_string_literal: true
require 'sinatra/base'

module OffBot
  # server for preventing Heroku from shutting me down
  class Server < Sinatra::Base
    get '/' do
      'OffBot FTW!'
    end
  end
end

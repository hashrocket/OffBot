# frozen_string_literal: true
set :output, File.expand_path('./log/cron_log.log')

every :monday, at: '9:30am' do
  runner 'OffBot::Announcer.announce'
end

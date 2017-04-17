# frozen_string_literal: true
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'lib/offbot'

desc 'Announce upcoming holidays'
task :announce do
  return unless Date.today.monday?
  OffBot::Announcer.announce
end

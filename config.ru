$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'lib/offbot'

Thread.abort_on_exception = true

Thread.new do
  begin
    OffBot::Bot.run
  rescue StandardError => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end

run OffBot::Server

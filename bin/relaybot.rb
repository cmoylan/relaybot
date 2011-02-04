#!/usr/bin/env ruby


$LOAD_PATH << File.dirname(__FILE__) + '/../lib'
require File.dirname(__FILE__) + '/../config2.rb'
require 'relaybot.rb'

# TODO: get command line arguments

pid = Process.fork do
  the_bot = RelayBot.new $CONFIG
  trap("QUIT") {the_bot.quit; exit}
end

Process.detach(pid)
# TODO: store the pid somewhere.
#
#
#
#PID_FILE = File.dirname(__FILE__) + '/../tmp/pid.txt'

#if File.exist?(PID_FILE)
  #puts "A bot is currently running. Shutting down..."

  #pid_file = File.new(PID_FILE, "r")
  #pid = pid_file.readline.to_i

  #Process.kill("QUIT", pid)
  #pid_file.close

  #File.delete(PID_FILE)
#end

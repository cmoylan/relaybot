#!/usr/bin/env ruby
#

$LOAD_PATH << File.dirname(__FILE__) + '/../lib'
require File.dirname(__FILE__) + '/../config.rb'
require 'relaybot.rb'

bot = RelayBot.new $CONFIG
#PID_FILE = File.dirname(__FILE__) + '/../tmp/pid.txt'

#if File.exist?(PID_FILE)
  #puts "A bot is currently running. Shutting down..."

  #pid_file = File.new(PID_FILE, "r")
  #pid = pid_file.readline.to_i

  #Process.kill("QUIT", pid)
  #pid_file.close

  #File.delete(PID_FILE)
#end

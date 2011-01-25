#!/usr/bin/env ruby

require 'bot.rb'
require 'sms_notifier.rb'

class RelayBot < Bot
  def initialize(server, port, channel, nick, password = nil)
    super(server, port, channel, nick, password)
    # setup the notifier
    # run
  end

  def listen(msg)
    if msg.match(/^#{@nick}(:)?/)
      # call the notifier
      say('you talking to me?')
    end
  end
end

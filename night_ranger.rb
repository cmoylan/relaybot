#!/usr/bin/env ruby

require 'bot.rb'

class NightRanger < Bot
  def listen(msg)
    if msg.match(/did.it.work/)
      say('yes it did')
    end
  end
end

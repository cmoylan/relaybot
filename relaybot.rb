#!/usr/bin/env ruby

require 'bot.rb'
require 'sms_notifier.rb'

class RelayBot < Bot
  def initialize(opts={})
  #def initialize(server, port, channel, nick, password=nil, gaccount, gpassword, number)
    args = {
      :password => nil
    }.merge(opts)

    super(args[:server], args[:port], args[:channel], args[:nick], args[:password])
    @notifier = SmsNotifier.new(args[:gaccount], args[:gpassword], args[:number])
  end

  def listen(msg)
    # If I am pinged (pung?), forward the message via sms
    #nick_match = /^#{@nick}(:)?/
    if msg.match(/^#{@nick}(:)?/)
      # TODO truncate the msg to 140 chars for sms limit
      puts truncate(msg.gsub(nick_match, ''), 135, '...')
      @notifier.sendSms(msg)
    end

  end
end


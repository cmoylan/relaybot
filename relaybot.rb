#!/usr/bin/env ruby

require 'bot.rb'
require 'sms_notifier.rb'

class RelayBot < Bot
  def initialize(params={})
  #def initialize(server, port, channel, nick, password=nil, gaccount, gpassword, number)
    args = {
      :password => nil
    }.merge(params)

    super(args[:server], args[:port], args[:channel], args[:nick], args[:password])
    @notifier = SmsNotifier.new(args[:gaccount], args[:gpassword], args[:number])
  end

  def listen(msg)
    # If I am pinged (pung?), forward the message via sms
    if msg.match(/^#{@nick}(:)?/)
      @notifier.sendSms('the message, truncated')
    end

  end
end


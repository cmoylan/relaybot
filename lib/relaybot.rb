#!/usr/bin/env ruby

require 'bot.rb'
require 'sms_notifier.rb'

# TODO: wrap some shit in begin/resue blocks so that when it breaks the whole
# process doesn't go to hell
# TODO: SMS notifier is blowing up. Probably because it's being called from within
# a folder. Fix it.
class RelayBot < Bot
  def initialize(opts={})
  #def initialize(server, port, channel, nick, password=nil, gaccount, gpassword, number)
    args = {
      :password => nil
    }.merge(opts)

    super(args[:server], args[:port], args[:channel], args[:nick], args[:password])
    @notifier = SmsNotifier.new(args[:gaccount], args[:gpassword], args[:number])
  end

  def listen(sender, msg)
    # If I am pinged (pung?), forward the message via sms
    if msg.match(/^#{@nick}(:)?/)
      # Truncate the msg to SMS limit, including sender
      msg = msg.slice(0..140 - sender.length)
      puts "SMSing: #{sender}: #{msg}"
      @notifier.sendSms "#{sender}: #{msg}"
    end

  end
end


#!/usr/bin/env ruby

require 'rubygems'
gem 'googlevoiceapi'
require 'googlevoiceapi'

class SmsNotifier
  def initialize(account, password, number)
    @number = number
    @voicebox = GoogleVoice::Api.new(account, password)
  end

  def sendSMS( msg)
    @voicebox.sms(@number, msg)
  end
end


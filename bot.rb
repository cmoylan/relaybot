#!/usr/bin/env ruby

require 'socket'

class NightRanger
  def initialize(server, port, channel)
    @channel = channel
    @socket = TCPSocket.open(server, port)
    say "NICK djmoymoy"
    say "USER djmoymoy 0 * djmoymoy"
    say "JOIN ##{@channel}"
    say_to_chan "#{1.chr}ACTION is here to help#{1.chr}"
  end

  def say(msg)
    puts msg
    @socket.puts msg
  end

  def say_to_chan(msg)
    say "PRIVMSG ##{@channel} :#{msg}"
  end

  def run
    until @socket.eof? do
      msg = @socket.gets
      puts msg

      if msg.match(/^PING :(.*)$/)
        say "PONG #{$~[1]}"
        next
      end

      if msg.match(/PRIVMSG ##{@channel} :(.*)$/)
        content = $~[1]

        #put matchers here
        if content.match(/did.it.work/)
          say_to_chan('it worked')
        end
      end
    end
  end

  def quit
    say "PART ##{@channel} :Out of here"
    say 'QUIT'
  end
end


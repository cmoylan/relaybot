#!/usr/bin/env ruby

require 'socket'

class Bot
  def initialize(server, port, nick, channel)
    @channel = channel
    @socket = TCPSocket.open(server, port)
    cmd "NICK #{nick}"
    cmd "USER #{nick} 0 * Your friendly neighborhood bot"
    cmd "JOIN ##{@channel}"
    say "#{1.chr}ACTION is here to serve#{1.chr}"
  end

  def cmd(msg)
    puts msg
    @socket.puts msg
  end

  def say(msg)
    cmd "PRIVMSG ##{@channel} :#{msg}"
  end

  def priv_msg(nick, msg)
    cmd "PRIVMSG #{nick} :#{msg}"
  end

  def listen(msg)
  end

  def run
    until @socket.eof? do
      msg = @socket.gets
      puts msg

      if msg.match(/^PING :(.*)$/)
        cmd "PONG #{$~[1]}"
        next
      end

      if msg.match(/PRIVMSG ##{@channel} :(.*)$/)
        content = $~[1]
        listen(content)
      end
    end
  end

  def quit(msg = 'Out of here')
    cmd "PART ##{@channel} :#{msg}"
    cmd 'QUIT'
  end
end


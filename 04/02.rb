require 'socket'

# 方案一
socket = TCPSocket.new('google.com', 80)

# 方案二
Socket.tcp('google.com', 80) do |connection|
  connect.close
end
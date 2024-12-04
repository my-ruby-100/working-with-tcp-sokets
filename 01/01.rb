# 1.2 创建首个套接字

# 默认情况下并不会被载入
require 'socket'

# Socket.constants
# AF_INET: IPv4
# SOCK_STREAM: 数据流 TCP
# SOCK_DGRAM: 数据报 UDP
Socket.new(Socket::AF_INET, Socket::SOCK_STREAM)
require 'socket'

# 3.5.2 连接处理
server = TCPServer.new(4481)
Socket.accept_loop(server) do |connection|
  # 要注意连接并不会在每个代码块结尾处自动关闭。传递给代码块的参 数和accept调用的返回值一模一样。
	connection.close
end


# 可以向它传递多个侦听 套接字，它可以接受在这些套接字上的全部连接
servers = Socket.tcp_server_sockets(4481)
Socket.accept_loop(server) do |connection|
  connection.close
end

# 3.5.3 合而为一
# 该方法实际上只是Socket.tcp_server_sockets和Socket.accept_loop 的一个包装器而已，但再也没有比它更简洁的写法了。
Socket.tcp_server_loop(4481) do | connection|
	connection.close
end
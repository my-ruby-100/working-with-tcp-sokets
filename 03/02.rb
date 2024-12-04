require 'socket'


# server = Socket.new(:INET, :STREAM)
# addr = Socket.pack_sockaddr_in(4481, '0.0.0.0')
# server.bind(addr)
# server.listen(5)

# 并不是Socket实例，而是TCPServer实例
server = TCPServer.new(4481)

# Ruby默认将侦听队列长度设置为 `5`。如果需要更长的侦听队列，可以调用 `TCPServer#listen`
server.listen(10)

# 两者的接口几乎一样，但还是存在一些重要的差异
# 其中最明显的就是TCPServer#accept只返回连接，而不返回remote_address。
connection = server.accept


# 使用这个Ruby包装器会返回两个TCP套接字，一个可以 通过IPv4连接，另一个可以通过IPv6连接，两者都在同一个端口上进 行侦听。
servers = Socket.tcp_server_sockets(4481)
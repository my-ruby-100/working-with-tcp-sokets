# echo ohai | nc 127.0.0.1 4481

require 'socket'

server = Socket.new(:INET, :STREAM)

# 3.1.1 该绑定到哪个端口
# * 规则1：不要使用0~1024之间的端口。这些端口是作为熟知（well-known）端口并保留给系统使用的
# * 规则2：不要使用49 000~65 535之间的端口。 这些都是临时（ephemeral ）端口
# * 除此之外，1025~48 999之间端口的使用是一视同仁的

# 3.1.2 该绑定到哪个地址
# * 当你绑定到某个由IP地址所描述的特定接口时，套 接字就只会在该接口上进行侦听，而忽略其他接口
# * 如果你希望侦听每一个接口，那么可以使用0.0.0.0。
addr = Socket.pack_sockaddr_in(4481, '0.0.0.0')


# 这个套接字现在被绑定到本地主机的端口4481上。其他套接字便不能 再使用此端口，否则会产生异常Errno::EADDRINUSE。
server.bind(addr)


# 3.2 服务器侦听
# * 这个数字表示服务器套接字能够容纳的待处理（pending）的最大连接数。 待处理的连接列表被称作侦听队列。
# * 如果新的客户端连接到达且侦听队列 已满，那么客户端将会产生Errno::ECONNREFUSED
# * 通过在运行时查看 Socket::SOMAXCONN可以获知当前所允许的最大的侦听队列长度
server.listen(5)


# 3.3 接受连接
# accept调用是阻塞式的。在它接收到一个新的连接之前，它会一直 阻塞当前线程
# accept 只不过就是将还未处理的连接从队列中弹出（pop）而已。如果队列为空，那么它就一直等，直到有连接被加入队列为止


# 第一个元素是 建立好的连接
# 第二个元素是一个Addrinfo对象。该对象描述了客 户端连接的远程地址。
connection, _ = server.accept

# 一个连接实际上就是Socket的一个实例。
print 'Connection class: '
p connection.class

print 'Server fileno: '
p server.fileno

print 'Connection fileno: '
p connection.fileno

# 每一个TCP连接都是由“本地主机、本地端口、远程主机、远程端口”
print 'Local address: '
p connection.local_address

print 'Remote address: '
p connection.remote_address


loop do 
  connection, _ = server.accept

  connection.close
end
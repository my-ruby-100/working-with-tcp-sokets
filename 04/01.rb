require 'socket'

socket = Socket.new(:INET, :STREAM)

# 如果客户端套接字 （或者服务器套接字）不调用 bind，那么它会从临时端口范围内获得 一个随机端口号。
# 因为我的建议是：不要给客户端绑定 端口！
remote_addr = Socket.pack_sockaddr_in(80, 'google.com')

# 但如果出现超时，最终会产生一个 Errno::ETIMEOUT 异常
socket.connect(remote_addr)
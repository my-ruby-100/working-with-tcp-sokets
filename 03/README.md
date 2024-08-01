# 第3章 服务器生命周期

|本期版本| 上期版本
|:---:|:---:
`Mon Dec 12 12:39:09 CST 2022` | -


## 3.3 接受连接

### 3.3.1 以阻塞方式接受连接

* accept调用是阻塞式的。在它接收到一个新的连接之前，它会一直 阻塞当前线程
* **accept 只不过就是将还未处理的连接从队列中弹出（pop）而已。如果队列为空，那么它就一直等，直到有连接被加入队列为止**



## 3.5 Ruby 包装器

### 3.5.1 服务器创建

```ruby
TCPServer.new(4481)

Socket.tcp_server_sockets(4481)
```

* `TCPServer#accept` 只返回连接
* Ruby默认将侦听队列长度设置为 `5`。如果需要更长的侦听队列，可以调用 `TCPServer#listen`


###3.5.2 连接处理

```ruby
Socket.accept_loop(server) do |connection|
	connection.close
end
```

* 要注意连接并不会在每个代码块结尾处自动关闭。传递给代码块的参 数和accept调用的返回值一模一样。
* 你可以向它传递多个侦听 套接字，它可以接受在这些套接字上的全部连接

### 3.5.3 合而为一

```ruby
Socket.tcp_server_loop(4481) do | connection|
	connection.close
end
```

## Ref

* [`TCPServer`](https://ruby-doc.org/stdlib-3.1.2/libdoc/socket/rdoc/TCPServer.html)、[`Socket#tcp_server_sockets`](https://ruby-doc.org/stdlib-3.1.2/libdoc/socket/rdoc/Socket.html#method-c-tcp_server_sockets)
* [`Socket#tcp_server_loop`](https://ruby-doc.org/stdlib-3.1.2/libdoc/socket/rdoc/Socket.html#method-c-tcp_server_loop)
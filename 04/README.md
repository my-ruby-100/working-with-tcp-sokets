# 第4章 客户端生命周期

|本期版本| 上期版本
|:---:|:---:
`Mon Dec 12 12:44:27 CST 2022` | -

## 4.1 客户端绑定

* 如果客户端套接字 （或者服务器套接字）不调用 bind，那么它会从临时端口范围内获得 一个随机端口号。
* 因为我的建议是：不要给客户端绑定 端口！


## 4.2 客户端连接


```ruby
remote_addr = Socket.pack_sockaddr_in(80, 'google.com')
socket.connect(remote_addr)
```

* 但如果出现超时，最终会产生一个 Errno::ETIMEOUT 异常


## 4.3 Ruby 包装器

```ruby
socket = TCPSocket.new('google.com', 80)
```

```ruby
Socket.tcp('google.com', 80) do |connection|
end
```


## Ref

* [TCPSocket](https://ruby-doc.org/stdlib-3.1.2/libdoc/socket/rdoc/TCPSocket.html)
* [Socket#tcp](https://ruby-doc.org/stdlib-3.1.2/libdoc/socket/rdoc/Socket.html#method-c-tcp)
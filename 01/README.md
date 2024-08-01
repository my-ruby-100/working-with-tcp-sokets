# 第 1 章 建立套接字

|本期版本| 上期版本
|:---:|:---:
`Mon Dec 12 12:28:54 CST 2022` | -



## 1.2 创建首个套接字

```ruby
# Socket.constants
Socket.new(Socket::AF_INET, Socket::SOCK_STREAM)
```


类型|含义
-----|-------
`Socket::SOCK_STREAM`| 数据流 TCP
`Socket::SOCK_DGRAM`| 数据报 UDP



## 1.6 端口

* 对每个套接字而言，IP地址和端口号的组合必须是唯一的
* 所以 在同一个侦听端口上可以有两个套接字，一个使用IPv4地址，另一 个 使 用 IPv6 地 址

## 1.7 创建第二个套接字

* 可以让你使用符号（而非常量）来描述各种选项

```ruby
Socket.new(:INET, :STREAM)
```

符号|常量
---|----
`:INET` | `Socket::AF_INET`
`:STREAM` | `Socket::SOCK_STREAM`


## 1.8 文档

* `man 2 socket`
* `ri Socket.new`

## Ref

* [https://ruby-doc.org/3.1.3/exts/socket/Socket.html](https://ruby-doc.org/3.1.3/exts/socket/Socket.html)
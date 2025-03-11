# 第 1 章 建立套接字

|本期版本| 上期版本
|:---:|:---:
`Tue Mar 11 16:10:01 CST 2025` | `Mon Dec 12 12:28:54 CST 2022`


## 1.4 环回地址

* 对应的主机名是 `localhost`, 对应的IP地址通常是 `127.0.0.1`

## 1.6 端口

* 对每个套接字而言，**IP地址和端口号的组合必须是唯一的**
* 所以 在同一个侦听端口上可以有两个套接字，一个使用IPv4地址，另一 个 使 用 IPv6 地 址


## 1.8 文档

* `man 2 socket`
* `ri Socket.new`

## Ref

* <https://ruby-doc.org/3.1.3/exts/socket/Socket.html>
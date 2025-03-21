# 第6章 套接字读操作

|本期版本| 上期版本
|:---:|:---:
`Tue Mar 11 17:19:59 CST 2025` | `Mon Dec 12 12:53:33 CST 2022`


```
TCPServer < IPSocket < BasicSocket < IO
```



## 6.3 读取长度

* 解决以上问题的一个方法是指定最小的读取长度。这样就不用等到客 户端结束发送才停止读取操作，而是告诉服务器读取（read）特定的 数据量，然后返回

## 6.4 阻塞的本质

* read调用会一直阻塞，直到获取了完整长度（full length）的数据为 止。
* 如果读取了一部分数据，但是不足1KB，那么read会一直阻塞， 直至获得完整的1KB数据为止。


## 6.5 EOF 事件

* 客户端发送EOF最简单的方式就是关闭自己的套接字。


## 6.6 部分读取

* readpartial 并 不 会 阻 塞 ， 而 是 立 刻 返 回 可 用 的 数 据
* 调 用 readpartial时，你必须传递一个整数作为参数，来指定最大的长度
* 当接收到EOF时， read仅仅是返回，而readpartial则会产生一个EOFError异常


## Ref

* <https://ruby-doc.org/3.4.1/IO.html>
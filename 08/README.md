# 第8章 缓 冲

|本期版本| 上期版本
|:---:|:---:
`Tue Mar 11 18:40:14 CST 2025` | -

## 8.1 写缓冲

* 如果write成功返回，这仅能保证你的数据已经交到了操作系统内核 的手中。它可以立刻发送数据，也可以出于效率上的考虑暂不发送， 将其同别的数据进行合并。
* TCP套接字默认将sync设置为true。这就跳过了Ruby的内部缓冲① ，

## 8.2 该写入多少数据

* 通常情况下，获得最佳性能的方法是一口气写入所有的数据，让内核 决定如何对数据进行结合

## 8.3 读缓冲

* Ruby实际上可能会接收大于你指定长度的数据。
* “多出的”数据会被存储在Ruby内部的读缓冲区中。

## 8.4 该读取多少数据

* 如果你根据应用程序所要接收的数据大小 来进行调优，那么就能获得最佳的性能
* 所有这些Web项目都是用 16KB作为各自的读取长度。


## Ref

* <https://github.com/mongrel/mongrel/blob/master/lib/mongrel/const.rb#L55>
* <https://github.com/ruby/webrick/blob/master/lib/webrick/httprequest.rb#L606>

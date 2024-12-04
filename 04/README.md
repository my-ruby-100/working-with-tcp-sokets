# 第 4 章 客户端生命周期

|本期版本| 上期版本
|:---:|:---:
`Wed Dec  4 14:39:43 CST 2024` | `Mon Dec 12 12:44:27 CST 2022`

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
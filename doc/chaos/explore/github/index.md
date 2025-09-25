# Github

## github 22 端口连接超时报错的解决办法

```
ssh: connect to host github.com port 22: Operation timed out
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
```

解决办法：

编辑文件：`~/.ssh/config`

添加如下：

```
Host github.com
  HostName ssh.github.com
  Port 443
  User git
  PreferredAuthentications publickey```
```

## GitHub 资源

- [Primer Design System](https://primer.style/)
- [beaudar/beaudar: 基于 GitHub issue 的轻量评论插件，Utterances 的中文版本](https://github.com/beaudar/beaudar)
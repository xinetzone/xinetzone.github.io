# Docker 常见问题

## /var/lib/docker/overlay2 占用很大，清理Docker占用的磁盘空间，迁移 /var/lib/docker 目录

- 查看磁盘 `/var/lib/docker/` 使用情况：
    ```bash
    sudo du -hs /var/lib/docker/
    ```
- `docker system df` 查看 Docker 的磁盘使用情况：
- `docker system prune` 命令可以用于清理磁盘，删除关闭的容器、无用的数据卷和网络，以及 dangling 镜像(即无 tag 的镜像)。
- 迁移 `/var/lib/docker` 目录：
    1. `systemctl stop docker` 停止 docker 服务
    2. 创建新的 docker 目录，执行命令 `df -h`，找一个大的磁盘。比如，`/home/`，并构建 `/home/docker/lib`
    3. 迁移 `/var/lib/docker` 目录下面的文件到 `/home/docker/lib`:
        ```bash
        rsync -avz /var/lib/docker /home/docker/lib/
        ```
    4. 配置 `/etc/systemd/system/docker.service.d/devicemapper.conf`。查看 `devicemapper.conf` 是否存在。如果不存在，就新建。
        ```bash
        sudo mkdir -p /etc/systemd/system/docker.service.d/
        sudo vi /etc/systemd/system/docker.service.d/devicemapper.conf
        ```
    5. 然后在 `devicemapper.conf` 写入：（同步的时候把父文件夹一并同步过来，实际上的目录应在 `/home/docker/lib/docker`）
        ```
        [Service]
        ExecStart=
        ExecStart=/usr/bin/dockerd  --graph=/home/docker/lib/docker
        ```
    6. 重新加载 docker:
        ```bash
        systemctl daemon-reload
        systemctl restart docker
        systemctl enable docker
        ```
    7. 确定容器没问题后删除 `/var/lib/docker/` 目录即可。

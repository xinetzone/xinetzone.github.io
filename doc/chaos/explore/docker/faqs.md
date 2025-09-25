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
    2. 迁移 `/var/lib/docker` 目录下面的文件到 `/media/pc/data/docker/lib/docker`（任意非系统盘位置）:
        ```bash
        sudo cp -r /var/lib/docker /media/pc/data/docker/lib/docker
        ```
    3. 在 `vim /etc/docker/daemon.json` 中配置镜像和容器的保存位置，刚安装 docker 后没有该文件，需要新建。
        ```
        {
            "data-root": "/media/pc/data/docker/lib/docker",
            "storage-driver": "overlay2"
        }
        ```
    4. 重新加载 docker:
        ```bash
        sudo systemctl daemon-reload
        sudo systemctl restart docker
        sudo systemctl enable docker
        ```
    5. `docker info` 查看 docker 镜像存储位置是否符合预期。
    6. 确定容器没问题后删除 `/var/lib/docker/` 目录即可。

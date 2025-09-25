# 镜像名称 tvm:xm
FROM tvmx:torch
# build 参数
ARG user=xm
ARG workspace=/home/${user}/workspace
# 添加用户：赋予sudo权限，指定密码
RUN useradd --create-home --no-log-init --shell /bin/bash ${user} \
    && adduser ${user} sudo \
    && echo "${user}:1" | chpasswd
# 改变用户的 UID 和 GID
# RUN usermod -u 1000 ${user} && usermod -G 1000 ${user}
# # 挂载
# VOLUME ${workspace}
# 指定容器起来的登录用户
USER ${user}
# 指定容器起来的工作目录
WORKDIR ${workspace}
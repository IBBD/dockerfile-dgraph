#
# Dgraph Dockerfile
#

# Pull base image.
FROM dgraph/dgraph:v0.8.3

MAINTAINER Alex Cai "cyy0523xc@gmail.com"

# 生成别名等
# 在0.8.3版本中，数据导入工具从原来的dgraphloader分裂为两个：dgraph-live-loader, dgraph-bulk-loader
# dgraph-bulk-loader工具导入速度更快，但是只适用于dgraph的初始化数据导入
ADD eyegraph.sh /usr/local/bin/eyegraph
RUN \
    chmod +x /usr/local/bin/eyegraph \
    && mv /usr/local/bin/dgraph /usr/local/bin/_eyegraph \
    && mv /usr/local/bin/dgraph-live-loader /usr/local/bin/eyeloader \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 终端设置
# 执行php-fpm时，默认值是dumb，这时在终端操作时可能会出现：terminal is not fully functional
ENV TERM xterm

# 解决时区问题
ENV TZ "Asia/Shanghai"

# 工作目录
WORKDIR /eyegraph

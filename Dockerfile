#
# Dgraph Dockerfile
#

# Pull base image.
FROM dgraph/dgraph:v0.8.1

MAINTAINER Alex Cai "cyy0523xc@gmail.com"

# 生成别名等
RUN \
    alias eyegraph=dgraph \
    && alias eyeloader=dgraphloader

# 终端设置
# 执行php-fpm时，默认值是dumb，这时在终端操作时可能会出现：terminal is not fully functional
ENV TERM xterm

# Define mountable directories.
VOLUME /var/www

# 工作目录
WORKDIR /dgraph

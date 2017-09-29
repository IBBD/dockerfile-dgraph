#!/bin/bash
# 
# EyeGraph启动脚本
# Author: alex
# Created Time: 2017年09月29日 星期五 11时55分44秒

if [ "$*" = "-version" ]; then
    _eyegraph -version|grep version|cut -d: -f2
else
    _eyegraph $*
fi

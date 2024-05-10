#! /bin/bash

# mac设备上的grep命令可能不支持grep -P选项，请使用Homebrew安装;或使用ggrep命令
#ps -eo pid,user,cmd|grep -P 'server/api.py|webui.py|fastchat.serve|multiprocessing'|grep -v grep|awk '{print $1}'|xargs kill -9

# 使用ps和grep来查找相关进程，并将进程ID存储在变量中
pids=$(ps -eo pid,user,cmd | grep -P 'server/api.py|webui.py|fastchat.serve|multiprocessing' | grep -v grep | awk '{print $1}')

# 检查是否找到了进程ID
if [ -n "$pids" ]; then
    # 如果有进程ID，则执行kill命令
    echo "Killing processes with IDs: $pids"
    kill $pids 2>/dev/null
else
    # 如果没有找到进程ID，则输出提示信息
    echo "No matching processes found to kill."
fi

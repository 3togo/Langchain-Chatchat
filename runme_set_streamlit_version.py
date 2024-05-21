#!/bin/bash

# 获取Streamlit的版本号
installed_version=$(streamlit --version 2>&1 | grep -oP '\d+\.\d+\.\d+')

# 检查是否获取到了版本号
if [[ -z "$installed_version" ]]; then
    echo "无法获取Streamlit的版本信息。请确保Streamlit已正确安装。"
    exit 1
fi

# 所需的Streamlit版本号
desired_version="1.33.0"

# 比较版本号
if [[ "$installed_version" != "$desired_version" ]]; then
    echo "Streamlit的版本不是$desired_version。正在安装或升级..."
    pip install streamlit==$desired_version
else
    echo "Streamlit的版本是$installed_version，无需安装或升级。"
fi


#!/bin/bash

# 获取脚本所在目录并切换过去
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR" || { echo "找不到目录！"; sleep 5; exit 1; }

echo "======================================"
echo "    正在启动 Claude 一键还原程序"
echo "======================================"

# 杀掉后台所有的 Claude 进程，防止文件被占用
pkill -9 -f "Claude" || true
sleep 1

# 调用主脚本的还原功能
./patch-desktop.sh --restore

echo "======================================"
echo "如果看到“恢复成功”，说明已成功还原为官方原版。"
echo "5秒后将自动打开原厂版 Claude 并退出终端..."
echo "======================================"

sleep 5

# 自动打开恢复后的官方版 Claude
open -a /Applications/Claude.app || true

# 自动关闭终端窗口
osascript -e 'tell application "Terminal" to close front window' & exit

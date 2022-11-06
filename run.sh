#!/bin/sh

WORK_DIR=$(cd "$(dirname "$0")" || exit; pwd)
LOG_FILE=${WORK_DIR}/data/log

# 进入工作目录（项目目录）
cd "${WORK_DIR}" || exit

# 判断环境并执行脚本
if command -v python3 > /dev/null 2>&1;then
    [ ! -f "${LOG_FILE}" ] && python3 -m pip install -r requirements.txt
    python3 wechat_steps.py >> "${LOG_FILE}" 2>&1
    exit 0
elif command -v python > /dev/null 2>&1 && [ "$(python --version | sed 's_.* __;s_\..*__')" -eq "3" ];then
    [ ! -f "${LOG_FILE}" ] && python -m pip install -r requirements.txt
    python wechat_steps.py >> "${LOG_FILE}" 2>&1
    exit 0
else
    echo "环境错误: 未找到可用的 Python3 环境"
    exit 1
fi

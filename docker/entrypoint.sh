#!/bin/bash
set -e

echo -e "======================1. 检测配置文件========================\n"
[ ! -d "${WORK_DIR}"/data ] && mkdir -p "${WORK_DIR}"/data
if [ ! -s "${WORK_DIR}"/data/config.yaml ];then
  echo -e "检测到不存在crontab.list或存在但文件为空，从示例文件复制一份用于初始化...\n"
  cp -fv "${WORK_DIR}"/sample/config.yaml "${WORK_DIR}"/data/config.yaml
fi
if [ ! -s "${WORK_DIR}"/data/crontab.list ];then
  echo -e "检测到不存在crontab.list或存在但文件为空，从示例文件复制一份用于初始化...\n"
  cp -fv "${WORK_DIR}"/sample/crontab.list "${WORK_DIR}"/data/crontab.list
  sed -i "s,WORK_DIR,${WORK_DIR},g" "${WORK_DIR}"/data/crontab.list
fi

echo -e "======================2. 启动定时任务========================\n"
crond
crontab "${WORK_DIR}"/data/crontab.list
echo -e "成功添加定时任务...\n"

exec "$@"
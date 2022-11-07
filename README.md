# 微信运动刷步数脚本

## 注意事项
1. 仅供学习交流，请勿用于商业或非法目的，否则后果自负。
2. 本项目参考并使用了 [Caryio/ChangeWechatSport](https://github.com/Caryio/ChangeWechatSport) 的代码。
3. 配置文件未做检查，请确保符合 yaml 语法，并且不缺少任何一项。

## 使用说明
下述两种方法任选其一即可

### 直接运行：
1. 安装好 Python3 环境。
2. 手机应用商店安装 Zepp APP。
3. 注册账号，不要用客户端授权登录，手动用邮箱注册。邮箱格式"手机号@163.com"，不需要真实邮箱。
4. 记下注册的邮箱和密码。
5. 进入 Zepp APP，绑定微信运动。
6. 克隆项目代码到本地 `git clone https://github.com/RikudouPatrickstar/WechatSteps.git`
7. 复制项目中 sample 目录为 data 目录。
8. 编辑 data/config.yaml 中的各项参数。
9. 手动执行 run.sh 或 run.cmd 运行脚本或参考 data/crontab.list 设置定时任务。

### 使用 Docker 运行：
1. 手机应用商店安装 Zepp APP。
2. 注册账号，不要用客户端授权登录，手动用邮箱注册。邮箱格式"手机号@163.com"，不需要真实邮箱。
3. 记下注册的邮箱和密码。
4. 进入 Zepp APP，绑定微信运动。
5. 拉取镜像 `docker pull thisispatrick/wechatsteps`
6. 运行容器：
```shell
mkdir wechat \
&& docker run -dit \
    --name wechat_steps \
    --hostname wechat_steps \
    --restart always \
    --mount type=bind,source=${PWD}/wechat,target=/wechat/data \
    thisispatrick/wechatsteps
```
7. 编辑 wechat 目录下的配置，填写好 config.yaml 中的各项参数，并设置 crontab.list 中的定时任务。
8. 重启容器 `docker restart wechat_steps`

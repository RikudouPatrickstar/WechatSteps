FROM python:alpine
LABEL maintainer="RikudouPatrickstar"
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    LANG=zh_CN.UTF-8 \
    SHELL=/bin/bash \
    PS1="\u@\h:\w \$ " \
    WORK_DIR=/wechat \
    PROJECT_URL=https://github.com/RikudouPatrickstar/WechatSteps.git
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update -f \
    && apk upgrade \
    && apk --no-cache add -f bash \
                             git \
                             wget \
                             curl \
                             vim \
                             tzdata \
                             openssl \
    && rm -rf /var/cache/apk/* \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && git clone ${PROJECT_URL} ${WORK_DIR} \
    && cd ${WORK_DIR} \
    && pip install -r requirements.txt
WORKDIR ${WORK_DIR}
ENTRYPOINT bash ${WORK_DIR}/docker/entrypoint.sh
FROM alpine:3.7

LABEL maintainer="lucianoneucamp@gmail.com"
LABEL alpine_version="3.7"
LABEL awscli_version="1.14.5"
LABEL description="Dockerized AWS CLI"

RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        jq \
        && \
    pip install --upgrade awscli==1.14.5 s3cmd==2.0.1 python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*

VOLUME /root/.aws
VOLUME /project
WORKDIR /project

CMD ["aws"]

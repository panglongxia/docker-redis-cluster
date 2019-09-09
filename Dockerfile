FROM centos:latest
MAINTAINER panglongxia "1294662090@qq.com"
RUN groupadd -r redis && useradd  -r -g redis redis
RUN  yum -y update &&  yum -y install epel-release \
&&   yum -y install redis  && yum -y install wget \
&&   yum -y install net-tools  \
&&   yum -y install ruby && yum -y install rubygems && yum -y install curl
RUN gem  install redis -v 3.2.1
COPY  ./config/redis-trib.rb  /usr/bin
COPY  ./config/redis.sh       /usr/bin
RUN  mkdir -p /config  && chmod  775  /usr/bin/redis.sh && chmod  775 /usr/bin/redis-trib.rb





FROM centos:7
MAINTAINER CandyMi "869646063@qq.com"

# 加入include与lib搜索路径
ENV LD_LIBRARY_PATH /usr/local/lib:$LD_LIBRARY_PATH
ENV C_INCLUDE_PATH /usr/local/include:$C_INCLUDE_PATH

WORKDIR /root/download

COPY ./lua-5.3.5.tar.gz /root/download/lua.tar.gz
COPY ./libev-4.25.tar.gz /root/download/libev.tar.gz

RUN yum groupinstall "development tools" -y && yum install autoconf git readline readline-devel openssl openssl-devel -y \
	&& tar zxvf lua.tar.gz && cd lua* && make linux MYCFLAGS=-fPIC && make install && cd .. \
	&& tar zxvf libev.tar.gz && cd libev* && ./configure --prefix=/usr/local && make && make install \
	&& rm -rf /roo/download /var/cache/yum \
	&& git clone https://github.com/CandyMi/core_framework /app \
	&& cd /app && make rebuild

# 使用者可在启动容器时使用-v命令将您的代码目录直接挂载到/app/script目录进行调试操作
WORKDIR /app

ENTRYPOINT ["./cfadmin"]

#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
NGINX_ROOT="/data/www/wwwroot"
NGINX_PORT=80
NGINX_USER=daemon
NGINX_GROUP=daemon
NGINX_VERSION="nginx-1.12.2"
NGINX_PREFIX="/opt/nginx"
NGINX_PCRE_VERSION="pcre-8.37"
NGINX_COMPILE_COMMAND="./configure --user=nobody --group=nobody --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_gzip_static_module --with-http_realip_module --with-http_sub_module --with-http_ssl_module"
yum -y install zlib zlib-devel openssl openssl-devel pcre pcre-devel gcc gcc-c++ make

yum install pcre pcre-devel -y 
wget http://nginx.org/download/$NGINX_VERSION.tar.gz
tar zxvf $NGINX_VERSION.tar.gz
cd $NGINX_VERSION
$NGINX_COMPILE_COMMAND
make && make install
/usr/local/nginx/sbin/nginx
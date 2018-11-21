TOMCAT_VERSION="apache-tomcat-8.5.34"
TOMCAT_HOME="/home/websoft/apache-tomcat-8.5.34"
cd /home/websoft
wget https://mirrors.cnnic.cn/apache/tomcat/tomcat-8/v8.5.34/bin/$TOMCAT_VERSION.tar.gz
tar zxvf $TOMCAT_VERSION.tar.gz

sed -i "2iexport JAVA_HOME=/usr/local/java/jdk1.8.0_191" /home/websoft/apache-tomcat-8.5.34/bin/catalina.sh
sed -i "3iexport JRE_HOME=/usr/local/java/jdk1.8.0_191/jre" /home/websoft/apache-tomcat-8.5.34/bin/catalina.sh

  cat > /usr/lib/systemd/system/tomcat8.service <<EOF
[Unit]
Description=tomcat
After=network.target
 
[Service]
Type=oneshot
ExecStart=/home/websoft/apache-tomcat-8.5.34/bin/startup.sh
ExecStop=/home/websoft/apache-tomcat-8.5.34/bin/shutdown.sh
ExecReload=/bin/kill -s HUP $MAINPID
RemainAfterExit=yes
 
[Install]
WantedBy=multi-user.target
EOF
chmod 754 /usr/lib/systemd/system/tomcat8.service

systemctl daemon-reload
systemctl enable tomcat8.service
systemctl start tomcat8.service

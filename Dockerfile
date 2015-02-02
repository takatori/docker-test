FROM centos:6.6
MAINTAINER "Satoshi Takatori" <takatori@ws.cs.kobe-u.ac.jp>

# リポジトリ・JPackage Projectを使うために必要なソフトのインストール
RUN yum -y update
RUN yum -y install yum-priorities
RUN rpm -Uvh http://mirrors.dotsrc.org/jpackage/6.0/generic/free/RPMS/jpackage-release-6-3.jpp6.noarch.rpm
RUN yum install --nogpgcheck tomcat7-webapps

RUN chkconfig tomcat7 on
RUN service tomcat7 start

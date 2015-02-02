FROM centos:6.6
MAINTAINER "Satoshi Takatori" <takatori@ws.cs.kobe-u.ac.jp>


# Tomcat7
## リポジトリ・JPackage Projectを使うために必要なソフトのインストール
RUN yum -y update
RUN yum -y install yum-priorities
## 以上で /etc/yum.repos.d/ 以下に jpackage.repo ファイルが出来上がる．
## ・tomcat7を依存関係こみこみでインストールしたければ，tomcat7-webappsを入れるのが楽．

## ただし，依存関係パッケージで署名が無いものがあるため，--nogpgcheck オプションを付けてインストールする必要がある．
RUN rpm -Uvh http://mirrors.dotsrc.org/jpackage/6.0/generic/free/RPMS/jpackage-release-6-3.jpp6.noarch.rpm
RUN yum -y install --nogpgcheck tomcat7-webapps
## 上記コマンドで，OpenJDKすら自動的に入る．

RUN chkconfig tomcat7 on
RUN service tomcat7 start


# mongoDB
## 参照リポジトリの追加
## ./etc/yum.repos.d/以下に下記内容の設定ファイル"mongodb.repo"を作成する
ADD ./conf/mongodb.repo /etc/yum.repos.d/
## インストール
RUN yum -y install mongodb-org

RUN chkconfig mongod on
RUN service mongod start



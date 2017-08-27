FROM debian:stable

LABEL maintainer="Federico Juarez <vafecitos@gmail.com>"

RUN echo deb http://ftp.debian.org/debian/ stretch main non-free contrib > /etc/apt/sources.list.d/backports.list 			;\
	echo deb-src http://ftp.debian.org/debian/ stretch main non-free contrib >> /etc/apt/sources.list.d/backports.list 		;\
	echo deb http://security.debian.org/ stretch/updates main contrib non-free >> /etc/apt/sources.list.d/backports.list 		;\
	echo deb-src http://security.debian.org/ stretch/updates main contrib non-free >> /etc/apt/sources.list.d/backports.list 	;\
	echo deb http://ftp.debian.org/debian/ stretch-updates main contrib non-free >> /etc/apt/sources.list.d/backports.list 		;\
	echo deb-src http://ftp.debian.org/debian/ stretch-updates main contrib non-free >> /etc/apt/sources.list.d/backports.list 	;\
	echo deb http://ftp.debian.org/debian/ stretch-backports main contrib non-free >> /etc/apt/sources.list.d/backports.list 	;\
	echo deb-src http://ftp.debian.org/debian/ stretch-backports main contrib non-free >> /etc/apt/sources.list.d/backports.list 	;\
	apt-get update 															;\ 
	apt upgrade 															;\
	apt-get install -y minidlna													;\
	apt-get clean															;\
	rm -rf /var/cache/apt/*

ADD ./run.sh /run.sh
ADD ./minidlna.conf /etc/minidlna.conf

ENTRYPOINT ["/usr/sbin/minidlnad", "-d", "-f /etc/minidlna.conf", "-R"]

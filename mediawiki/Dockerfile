FROM centos:7
ENV mediawiki_binary="https://releases.wikimedia.org/mediawiki/1.34/mediawiki-1.34.2.tar.gz" 
RUN    yum install -y centos-release-scl
RUN 	yum install -y rh-php73 && \
		yum install -y rh-php73-php && \
		yum install -y rh-php73-php-pdo && \
		yum install -y rh-php73-php-devel && \
		yum install -y rh-php73-php-mysqlnd && \
		yum install -y rh-php73-php-fpm && \
		yum install -y rh-php73-php-mbstring && \
		yum install -y rh-php73-php-mysqlnd && \
		yum install -y rh-php73-php-gd && \
		yum install -y rh-php73-php-xml && \
		yum install -y mariadb-server && \
		yum install -y mariadb 
#COPY distribution/* /opt/rh/httpd24/root/var/www/
#RUN chmod u+x /opt/rh/httpd24/root/var/www/

ADD https://releases.wikimedia.org/mediawiki/1.34/mediawiki-1.34.2.tar.gz /opt/rh/httpd24/root/var/www/

RUN chmod u+x /opt/rh/httpd24/root/var/www/mediawiki-1.34.2.tar.gz && \ 
    cd /opt/rh/httpd24/root/var/www/ && \
    tar -zxf /opt/rh/httpd24/root/var/www/mediawiki-1.34.2.tar.gz && \
    ln -s mediawiki-*/ mediawiki

RUN sed -i '55 a LoadFile /opt/rh/httpd24/root/usr/lib64/libnghttp2-httpd24.so.14' /opt/rh/httpd24/root/etc/httpd/conf/httpd.conf;sed -i '96 a ServerName localhost:80' /opt/rh/httpd24/root/etc/httpd/conf/httpd.conf 

RUN  sed -i s#'DocumentRoot "/opt/rh/httpd24/root/var/www/html"'#'DocumentRoot "/opt/rh/httpd24/root/var/www"'#g /opt/rh/httpd24/root/etc/httpd/conf/httpd.conf 
RUN  sed -i s#'<Directory "/opt/rh/httpd24/root/var/www/html">'#'<Directory "/opt/rh/httpd24/root/var/www">'#g /opt/rh/httpd24/root/etc/httpd/conf/httpd.conf 
RUN  sed -i  s#'DirectoryIndex index.html'#'DirectoryIndex index.html index.html.var index.php'#g /opt/rh/httpd24/root/etc/httpd/conf/httpd.conf 

    		
RUN chmod a+xr /opt && \
    useradd -b /opt -m -s /bin/bash -u 501 opsadmin && \
    echo "opsadmin ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    echo "Defaults    !requiretty" >> /etc/sudoers

WORKDIR /opt
CMD ["/opt/rh/httpd24/root/usr/sbin/httpd","-D","FOREGROUND"]



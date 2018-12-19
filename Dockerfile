FROM debian
RUN echo 'deb http://deb.debian.org/debian stretch main' > /etc/apt/sources.list.d/dockerlist.list && \
apt update && \
apt upgrade -y && \
apt install -y nginx && \
apt clean

RUN rm -rf /var/www/* && \
mkdir /var/www/dunes.com && \
mkdir /var/www/dunes.com/img && \
chmod -R 754 /var/www/dunes.com/ && \
useradd dmitry && \
groupadd teryaev && \
usermod -g teryaev dmitry && \
chown dmitry:teryaev /var/www/dunes.com/ && \
sed -i 's@/var/www/html@/var/www/dunes.com@g' /etc/nginx/sites-enabled/default && \
sed -i 's@www-data@dmitry@g' /etc/nginx/nginx.conf && \
service nginx start

ADD index.html /var/www/dunes.com
ADD 1496844410150.jpeg /var/www/dunes.com/img/  

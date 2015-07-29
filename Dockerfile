FROM ubuntu:14.04

EXPOSE 80

RUN apt-get update && \
    apt-get install -y \
        apache2 \
        libc6-i386 \
        unzip \
        wget

RUN mkdir -p /usr/local/livecode && cd /usr/local/livecode && \
    wget "http://downloads.livecode.com/livecode/7_0_6/LiveCodeCommunityServer-7_0_6-Linux-x86_64.zip" && \
    unzip LiveCodeCommunityServer-7_0_6-Linux-x86_64.zip && \
    chmod 755 livecode-community-server && \
    a2enmod actions && a2enmod cgi
    
COPY apache2/apache2.conf /etc/apache2/apache2.conf

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_RUN_DIR=/var/run/apache2

ENTRYPOINT ["/usr/sbin/apache2"]
CMD ["-D", "FOREGROUND"]

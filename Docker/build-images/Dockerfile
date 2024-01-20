FROM ubuntu:latest
LABEL "AUTHOR"="knammm"
LABEL "Project"="nano"
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install apache2 git -y
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80
WORKDIR /var/www/html
VOLUME /var/log/apache2
ADD web.tar.gz /var/www/html
# COPY web.tar.gz /var/www/html => do not untar the .tar file

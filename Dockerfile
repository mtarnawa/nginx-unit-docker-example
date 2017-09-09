FROM ubuntu:zesty
ADD http://nginx.org/keys/nginx_signing.key /tmp
EXPOSE 8300
WORKDIR /tmp
RUN /bin/bash -c 'apt-key add nginx_signing.key'
RUN /bin/bash -c 'echo "deb http://nginx.org/packages/mainline/ubuntu/ xenial nginx\ndeb-src http://nginx.org/packages/mainline/ubuntu/ xenial nginx" >> /etc/apt/sources.list'
RUN /bin/bash -c 'apt-get update && apt-get install unit python -y --no-install-recommends'
WORKDIR /www
CMD ["unitd", "--no-daemon"]
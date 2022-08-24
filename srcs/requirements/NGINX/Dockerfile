FROM	debian:stable-20220801

RUN	apt-get	update \
	&& apt-get install -y nginx \
	&& apt-get install -y openssl

CMD	nginx -g 'daemon off;'

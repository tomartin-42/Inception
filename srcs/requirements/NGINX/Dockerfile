FROM	debian:buster

RUN	apt-get	update \
	&& apt-get install -y nginx \
	&& apt-get install -y openssl

# Get ssl pasw to self signed certificate
RUN openssl req -x509 -nodes -days 365 -subj \
	"/C=CA/ST=QC/O=42Madrid, Inc./CN=tomartin.42.fr" \
	-addext "subjectAltName=DNS:tomartin.42.fr" -newkey rsa:2048 \
	-keyout /etc/ssl/private/tomartin.key -out /etc/ssl/certs/tomartin.crt

RUN rm -rf /etc/nginx/sites-enabled/*

#Copy configuration file
COPY default.conf /etc/nginx/conf.d/

CMD	nginx -g 'daemon off;'

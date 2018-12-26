# docker build -t pirunit:latest .
# docker run -it --rm --name=pi-runit pirunit

FROM arm32v6/alpine:3.7 

ENV LOGGER=false
RUN adduser -D -g 'www' www

# RUN mkdir -p /opt/app
WORKDIR /www/images
# COPY config.yml /opt/app/config/
# COPY target /opt/app/

COPY /docker /

RUN 	mkdir /etc/container_environment &&\
        chmod a+x /sbin/start_runit && mkdir /etc/service && \ 
	apk add nginx && apk add python && \
	# mkdir /etc/runit_init.d && \
        apk --update upgrade && apk add runit && rm -rf /var/cache/apk/*

RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

CMD ["/sbin/start_runit"]

FROM nginx

# Add files
COPY ./site/build/ /usr/share/nginx/html

RUN rm /etc/nginx/conf.d/default.conf

COPY ./conf/default.conf /etc/nginx/conf.d/default.conf
#COPY ./conf/nginx.conf /etc/nginx/nginx.conf

WORKDIR /usr/share/nginx/html

EXPOSE 8080

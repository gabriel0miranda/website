FROM nginx

# Add files
COPY ./site/public/ /etc/nginx/html/

RUN rm /etc/nginx/conf.d/default.conf

COPY ./conf/default.conf /etc/nginx/conf.d/default.conf
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

WORKDIR /etc/nginx/html

EXPOSE 8080

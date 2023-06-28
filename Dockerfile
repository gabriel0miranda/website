FROM openresty/openresty:1.21.4.1-8-alpine-fat

RUN luarocks --lua-version=5.1 OPENSSL_DIR=/usr/local/openresty/openssl/ CRYPTO_DIR=/usr/local/openresty/openssl/ install lapis

# Add files
COPY . .

RUN mkdir /var/log/nginx && \
    rm /etc/nginx/conf.d/default.conf && \
    mv ./conf/default.conf /etc/nginx/conf.d/default.conf && \
    mv ./conf/nginx.conf /etc/nginx/nginx.conf && \
    mv ./site/* /usr/local/openresty/site

WORKDIR /usr/local/openresty/site


EXPOSE 8080

FROM haproxy:2.5

USER root

RUN apt update -y && \
    apt install -y openssl && \
    openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
    -keyout /tmp/localhost.key -out /tmp/localhost.cert \
    -subj "/C=IT/ST=Tuscany/L=Prato/O=Test/CN=localhost" && \
    mkdir /etc/certs && \
    cat  /tmp/localhost.cert /tmp/localhost.key | tee /etc/certs/localhost.pem 
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

USER haproxy

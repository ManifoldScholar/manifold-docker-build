FROM nginx:1.19

RUN apt-get -o Acquire::Check-Valid-Until=false update
RUN apt-get install -y openssl

COPY dockerfiles/manifold_proxy/config/default.conf /etc/nginx/conf.d/default.conf

COPY dockerfiles/manifold_proxy/includes/manifold-client-local /etc/nginx/includes/manifold-client-local
COPY dockerfiles/manifold_proxy/includes/manifold-server-local /etc/nginx/includes/manifold-server-local

COPY dockerfiles/manifold_proxy/scripts/install-self-signed-cert /usr/local/bin/install-self-signed-cert


VOLUME ["/manifold_sockets","/manifold_data"]

EXPOSE 80 443

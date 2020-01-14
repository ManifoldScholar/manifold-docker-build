FROM node:12.14.0

ARG MANIFOLD_VERSION

COPY manifold-src /opt/manifold
WORKDIR /opt/manifold/client
RUN yarn install
RUN cat /dev/null > /opt/manifold/client/dist/manifold/ssr/ssr.config.js
VOLUME ["/manifold_sockets","/manifold_data"]

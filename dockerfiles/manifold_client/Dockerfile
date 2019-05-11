FROM node:8.11.2

ARG MANIFOLD_VERSION

COPY src /opt/manifold
WORKDIR /opt/manifold/client
RUN yarn install && yarn build:prod
RUN cat /dev/null > /opt/manifold/client/dist/manifold/ssr/ssr.config.js
VOLUME ["/manifold_sockets","/manifold_data"]

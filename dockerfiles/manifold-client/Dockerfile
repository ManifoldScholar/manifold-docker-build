FROM node:12.22.1
COPY manifold-src/client /opt/manifold/client
WORKDIR /opt/manifold/client
RUN yarn install
RUN cat /dev/null > /opt/manifold/client/dist/manifold/ssr/ssr.config.js

FROM node:12.14.0
RUN mkdir /root/.ssh
RUN ssh-keyscan -H github.com >> ~/.ssh/known_hosts
COPY manifold-src /opt/manifold
WORKDIR /opt/manifold
RUN git remote rm origin
RUN git remote add origin https://github.com/ManifoldScholar/manifold.git
RUN git fetch
WORKDIR /opt/manifold/client
RUN yarn install
RUN cat /dev/null > /opt/manifold/client/dist/manifold/ssr/ssr.config.js

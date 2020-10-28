FROM ruby:2.6.3
RUN echo "deb [check-valid-until=no] http://cdn-fastly.deb.debian.org/debian jessie main" > /etc/apt/sources.list.d/jessie.list
RUN echo "deb [check-valid-until=no] http://archive.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list
RUN sed -i '/deb http:\/\/deb.debian.org\/debian jessie-updates main/d' /etc/apt/sources.list
RUN apt-get -o Acquire::Check-Valid-Until=false update
RUN apt-get install -y libicu-dev postgresql-client nano
RUN mkdir /root/.ssh
RUN ssh-keyscan -H github.com >> ~/.ssh/known_hosts
COPY manifold-src /opt/manifold
WORKDIR /opt/manifold
RUN git remote rm origin
RUN git remote add origin https://github.com/ManifoldScholar/manifold.git
RUN git fetch
ENV RAILS_LOG_TO_STDOUT=1
RUN gem update --system && gem install bundler:1.17.3
WORKDIR /opt/manifold/api
RUN bundle install
COPY dockerfiles/manifold-api/scripts/start-and-run /opt/manifold/api/start-and-run
WORKDIR /opt/manifold/api


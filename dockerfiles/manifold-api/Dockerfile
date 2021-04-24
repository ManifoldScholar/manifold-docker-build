FROM ruby:2.6.7
RUN apt-get -o Acquire::Check-Valid-Until=false update
RUN apt-get install -y libicu-dev postgresql-client nano curl software-properties-common

# We need Node and Mammoth for Word text ingestion
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g mammoth@^1.4.16

COPY manifold-src/api /opt/manifold/api
WORKDIR /opt/manifold/api
ENV RAILS_LOG_TO_STDOUT=1
RUN gem update --system && gem install bundler:1.17.3
RUN bundle install
COPY dockerfiles/manifold-api/scripts/start-and-run /opt/manifold/api/start-and-run

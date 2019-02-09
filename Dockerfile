FROM ruby:2.5.3

ENV INSTALL_PATH /shipup_test

RUN apt-get update && apt-get -y install postgresql postgresql-contrib mysql-client

# This will allow our spec image to wait for DBs to be ready
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.4.0/wait /wait
RUN chmod +x /wait

RUN mkdir $INSTALL_PATH
WORKDIR $INSTALL_PATH

COPY Gemfile* $INSTALL_PATH/
RUN bundle install

COPY . $INSTALL_PATH

CMD /wait && rspec

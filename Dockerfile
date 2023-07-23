FROM ruby:3.2.2-slim-bullseye

WORKDIR /money-monitor

RUN apt-get update -y && \
    apt-get install -y wget gnupg

#adds posgresql repository
RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ bullseye-pgdg main' >  /etc/apt/sources.list.d/pgdg.list && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt-get update -y && \
    apt-get install -y postgresql-client-15 \
    libpq-dev git make file gcc g++ cmake pkg-config

COPY . .

RUN gem install bundler && \
    bundle install

CMD [ "bash", "-c", "bin/rails server -p 3000 -b 0.0.0.0" ]

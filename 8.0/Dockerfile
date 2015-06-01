FROM azukiapp/debian
MAINTAINER Azuki <support@azukiapp.com>

# ==============================================================================
# Install Postgres, MySQL, MongoDB and more dependencies
# ==============================================================================

ENV PG_MAJOR 9.4

# Add PostgreSQL Global Development Group apt source
RUN  packages=" \
    imagemagick \
    libcurl4-openssl-dev \
    libpq-dev \
    libreadline-dev libreadline6-dev \
    libssl-dev \
    libxml2-dev \
    libxslt-dev \
    libyaml-dev \
    mongodb \
    mysql-client libmysqlclient-dev \
    postgresql-client-$PG_MAJOR \
    sqlite3 libsqlite3-dev \
  " \
  && set -x \
  && apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8 \
  && echo 'deb http://apt.postgresql.org/pub/repos/apt/ wheezy-pgdg main' $PG_MAJOR > /etc/apt/sources.list.d/pgdg.list \
  && apt-get update -yy \
  && apt-get install -y --no-install-recommends $packages \
  && apt-get autoremove --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

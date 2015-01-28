# The container includes:
#
# azukiapp/web-based:
# * MySQL Client
# * PostgreSQL Client
# * MongoDB
#

FROM azukiapp/ubuntu
MAINTAINER Azuki <support@azukiapp.com>

# ==============================================================================
# Install Postgres, MySQL, MongoDB and more dependencies
# ==============================================================================

ENV PG_MAJOR 9.3
ENV PG_VERSION 9.3.4

# Add PostgreSQL Global Development Group apt source
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" \
    > /etc/apt/sources.list.d/pgdg.list

# Add PGDG repository key
RUN wget -qO - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc \
    | apt-key add -

RUN  apt-get update -qq \
  && apt-get install -y -qq \
      libcurl4-openssl-dev \
      libffi-dev \
      libgdbm-dev \
      libpq-dev \
      libreadline6-dev \
      libssl-dev \
      libtool \
      libxml2-dev \
      libxslt-dev \
      libyaml-dev \
      software-properties-common \
      zlib1g-dev \
      mongodb \
      mysql-client \
      postgresql-client-$PG_MAJOR \
      libmysqlclient-dev \
  && apt-get clean -qq \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

FROM elixir:latest

ENV PYTHONUNBUFFERED=1

RUN echo "**** install Python ****" && \
    apt-get install python3 && \
    if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi

RUN apt-get update && \
    apt-get install -y postgresql-client

RUN mix local.hex --force && \
    mix local.rebar --force

RUN apt-get install -y nodejs inotify-tools
RUN apt-get install -y npm

ENV SECRET_KEY_BASE=gwsmwKuOjrKkDdUG7+5aNIajSROLpBr/O8AQ71dLGNS4Hyq5i1XPNNmOWY3Sy24y
ENV DATABASE_URL=ecto://jackson:portable20relaydb!@db/pg_db

# Cache elixir deps
ADD mix.exs mix.lock ./

# Same with npm deps
ADD assets/package.json assets/webpack.config.js assets/

WORKDIR /app

# COPY test test
COPY mix.exs .
COPY mix.lock .
COPY .formatter.exs .formatter.exs
COPY lib lib
COPY priv priv
COPY config config
RUN mkdir assets
COPY assets/css assets/css
COPY assets/static assets/static
COPY assets/js assets/js
COPY assets/webpack.config.js assets/webpack.config.js
COPY assets/package.json assets
COPY assets/package-lock.json assets


# Cache elixir deps
RUN mix do deps.get, deps.compile

# if npm makes python3 error, add below line
RUN apt-get install -y python2
RUN npm config set python python2.7

# Same with npm deps
RUN cd assets && \
    npm install

# Run frontend build, compile, and digest assets
RUN cd assets/ && \
    npm run deploy && \
    cd - && \
    mix do compile, phx.digest

EXPOSE 4000

# USER default
CMD  mix phx.server 
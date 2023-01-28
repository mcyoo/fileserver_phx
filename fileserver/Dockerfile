FROM elixir:latest

ENV MIX_ENV=prod

RUN apt-get update && \
    apt-get install -y postgresql-client

RUN mix local.hex --force && \
    mix local.rebar --force

RUN mkdir /app
WORKDIR /app

COPY . .

ENV SECRET_KEY_BASE=gwsmwKuOjrKkDdUG7+5aNIajSROLpBr/O8AQ71dLGNS4Hyq5i1XPNNmOWY3Sy24y
ENV DATABASE_URL=ecto://jackson:portable20relaydb!@db/pg_db

RUN mix deps.get
RUN mix do deps.compile, compile

RUN mix do compile, phx.digest

EXPOSE 4000

CMD ["mix", "phx.server"]
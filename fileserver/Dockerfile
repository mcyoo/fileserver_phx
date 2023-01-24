FROM elixir:latest

ENV MIX_ENV=prod

RUN apt-get update && \
    apt-get install -y postgresql-client

RUN mix local.hex --force && \
    mix local.rebar --force

RUN mkdir /app
WORKDIR /app

COPY . .

RUN mix do deps.get, deps.compile, compile

EXPOSE 4000

CMD ["mix", "phx.server"]
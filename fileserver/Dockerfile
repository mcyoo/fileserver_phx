FROM elixir:latest

RUN apt-get update && apt-get install -y nodejs inotify-tools

RUN mix local.hex --force && mix local.rebar --force && mix archive.install hex phx_new 1.5.11

RUN mkdir /app

WORKDIR /app

COPY . .

RUN mix deps.get && mix do compile

CMD mix phx.server
FROM elixir:latest

RUN apt-get update && apt-get install -y nodejs inotify-tools

RUN mix local.hex --force && mix local.rebar --force && mix archive.install hex phx_new 1.5.11

ENV SECRET_KEY_BASE=gwsmwKuOjrKkDdUG7+5aNIajSROLpBr/O8AQ71dLGNS4Hyq5i1XPNNmOWY3Sy24y
ENV DATABASE_URL=ecto://relay_server:portable20relaydb!@db/relay_server_db

COPY . /app/

WORKDIR /app
RUN mix deps.get && mix do compile

EXPOSE 4000
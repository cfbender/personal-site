FROM elixir:1.12.2-alpine AS builder



# install build dependencies

RUN apk add --update git build-base nodejs npm curl



# Set environment variables for building the application

ENV MIX_ENV=prod


# Set show dashboard and default to false
ARG SHOW_DASHBOARD="false"
ENV SHOW_DASHBOARD $SHOW_DASHBOARD



# Install hex and rebar

RUN mix local.hex --force && mix local.rebar --force



# Create the application build directory

RUN mkdir /app

WORKDIR /app



# Copy over all the necessary application files and directories

COPY config ./config

COPY lib ./lib

COPY priv ./priv

COPY mix.exs mix.lock ./



# get deps because assets depend on them

RUN mix deps.get --only prod



# Install & build assets

# This should be done before elixir compilation

# for SVG support - https://github.com/nikkomiu/phoenix_inline_svg/issues/25

COPY ["assets/package.json", "assets/package-lock.json*", "./assets/"]

RUN npm ci --prefix assets

COPY assets assets

RUN mix assets.build



RUN mix deps.compile

RUN mix compile

CMD ["mix", "phx.server"]

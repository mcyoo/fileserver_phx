# Use the official Elixir image as the base image
FROM elixir:latest

# Set the working directory
WORKDIR /app

# Copy the application files into the container
COPY . .

# Install the Phoenix dependencies
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get

# Build the assets
RUN cd assets && \
    npm install && \
    node node_modules/webpack/bin/webpack.js --mode production

# Compile the application
RUN mix compile

# Run the Phoenix server
CMD ["mix", "phx.server"]
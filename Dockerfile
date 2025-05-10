FROM ruby:3.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential nodejs entr

# Set working directory
WORKDIR /app

# Install Bundler first
RUN gem install bundler

# Copy Gemfiles separately for cache efficiency
COPY Gemfile Gemfile.lock ./

# Install Ruby gems
RUN bundle install

# Copy entire site
COPY . .

EXPOSE 4000

# Default command (will be overridden by docker-compose)
CMD ["bash"]


FROM ruby:3

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs && \
    gem install github-pages

WORKDIR /workspace
COPY . .
RUN bundle install

EXPOSE 4001
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--port", "4001"]
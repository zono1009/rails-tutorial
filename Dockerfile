FROM ruby:3.4

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

CMD ["rails", "server", "-b", "0.0.0.0"]
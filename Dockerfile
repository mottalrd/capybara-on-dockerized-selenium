FROM ruby:2.3
RUN apt-get update -qq && apt-get install -y build-essential nodejs

RUN mkdir /app
WORKDIR /app
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

CMD ["rails", "server", "-b", "0.0.0.0"]

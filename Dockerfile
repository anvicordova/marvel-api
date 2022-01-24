FROM ruby:3.0.0

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

RUN gem install bundler -v 2.3.5 && bundle config jobs 7

ADD Gemfile $APP_HOME/
ADD Gemfile.lock  $APP_HOME/
RUN bundle install

ADD Gemfile.tip $APP_HOME/
RUN bundle install

ADD . $APP_HOME
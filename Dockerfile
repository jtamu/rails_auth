FROM ruby:2.5
RUN apt update
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
RUN apt install -y nodejs
ADD . /myapp
RUN bundle exec rails db:migrate && bundle exec rails db:seed


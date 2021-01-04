FROM ruby:2.7.2 AS development

WORKDIR /taurus

COPY . .

RUN bundle install

# CMD ['bundle', 'exec', './mock/taurus_mock.rb']

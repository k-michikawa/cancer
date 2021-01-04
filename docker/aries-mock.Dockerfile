FROM ruby:2.7.2 AS development

WORKDIR /aries

COPY . .

RUN bundle install

# CMD ['bundle', 'exec', './mock/aries_mock.rb']

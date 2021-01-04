FROM ruby:2.7.2 AS development

WORKDIR /cancer

COPY . .

# bundle install
RUN bundle install

# generate *pb.rb
RUN bundle exec grpc_tools_ruby_protoc -I . --ruby_out=lib --grpc_out=lib proto/*

# CMD ['bundle', 'exec', './src/main.rb']

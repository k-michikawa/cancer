FROM ruby:2.7.2 AS development

RUN apt-get update && apt-get install -y wget

# protoファイル管理ツール落としてくる
WORKDIR /tmp

RUN wget https://github.com/stormcat24/protodep/releases/download/0.0.8/protodep_darwin_amd64.tar.gz
RUN tar -xf protodep_darwin_amd64.tar.gz
RUN mv protodep /usr/local/bin/

# 起動するために色々
WORKDIR /cancer

# download dependent proto file
RUN protodep up

# bundle install
RUN bundle install

# generate *pb.rb
RUN bundle exec grpc_tools_ruby_protoc -I . --ruby_out=lib --grpc_out=lib proto/*

# DBmigration
RUN bundle exec rake db:create
RUN bundle exec rake db:migrate

CMD ['bundle', 'exec', './src/main.rb']

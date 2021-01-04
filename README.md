# cancer

### Description

Ruby で ActiveRecord 使って gRPC で CRUD するやつ

Ruby 2.7.2

検証用に grpcurl 入れておくと良いかも

mac: `brew install grpcurl`

example:

```sh
$ grpcurl -plaintext \
          -import-path ./proto \
          -proto order.proto \
          -d '{"productId": "4a7ef360-d798-4aa3-ac6e-7a6a95414c2c", "ordererId": "b3ef5930-f849-443a-a415-21a095088568"}' \
          localhost:9030 \
          leo.OrderService/PostOrder
```

### tools

migration ファイルの生成

```sh
$ `bundle exec rake "gen_migrate_file[/* filename */]"`
```

protodep のインストール

```sh
$ go get github.com/stormcat24/protodep
```

OR

```sh
$ wget https://github.com/stormcat24/protodep/releases/download/0.0.8/protodep_darwin_amd64.tar.gz
$ tar -xf protodep_darwin_amd64.tar.gz
$ mv protodep /usr/local/bin/
```

AFTER

```sh
$ ssh-add ~/.ssh/id_rsa
```

### run

起動するまで

1. rbenv とかで Ruby の環境作っておく
2. protodep 落としてくる
3. `$ protodep up`
4. `$ bundle install`
5. `$ grpc_tools_ruby_protoc -I . --ruby_out=lib --grpc_out=lib proto/*`
6. `$ docker-compose run -d --service-ports cancer-db`
7. `$ bundle exec db:create`
8. `$ bundle exec db:migrate`
9. `$ docker stop /* 6で立ち上げた container name */`
10. `$ docker-compose up`

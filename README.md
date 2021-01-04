# cancer

Ruby で ActiveRecord 使って gRPC で CRUD するやつ

検証用に grpcurl 入れておくと良いかも

mac: `brew install grpcurl`

example: `grpcurl -plaintext -import-path ./proto -proto order.proto -d '{"productId": "4a7ef360-d798-4aa3-ac6e-7a6a95414c2c", "ordererId": "b3ef5930-f849-443a-a415-21a095088568"}' localhost:9030 leo.OrderService/PostOrder`

起動するまで

1. Ruby の実行環境作っておく(v2.7.2。migrate とか pb ファイルの生成するのに bundle 使う)
2. protodep 落としてくる
3. `protodep up`
4. `bundle install`
5. `grpc_tools_ruby_protoc -I . --ruby_out=lib --grpc_out=lib proto/*`
6. `bundle exec db:create`
7. `bundle exec db:migrate`
8. `docker-compose up`

migrate ファイルの生成

1. `bundle exec rake "gen_migrate_file[/* filename */]"`
2. 中身を書く(rails 積んでるわけではないので頑張る)

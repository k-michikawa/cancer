# frozen_string_literal: true
require 'logger'
require 'grpc'

# GRPC::RpcServerがデフォルトだと色々と使いづらいので使いやすいようにラップするやつ
# cf. https://www.rubydoc.info/gems/grpc/GRPC/RpcServer#initialize-instance_method
class RpcServer
  def initialize(host:)
    server = GRPC::RpcServer.new(
      pool_size: 30,
      max_waiting_requests: 20,
      poll_period: 1,
      pool_keep_alive: 0.25,
      connect_md_proc: nil,
      server_args: {},
      # Experimental API
      interceptors: [CancerInterceptor.new]
    )
    server.add_http2_port(host, :this_port_is_insecure)
    @server = server
    @logger = Logger.new($stdout)
  end

  def handle(handler)
    @server.handle(handler)
  end

  def run
    @logger.info('Start cancer!')
    @server.run_till_terminated_or_interrupted(%w[SIGHUP SIGINT SIGQUIT])
  end
end

class CancerInterceptor < GRPC::ServerInterceptor
  def initialize
    super()
    @logger = Logger.new($stdout)
  end

  def request_response(request:, call:, method:)
    @logger.info "{ \"method\": \"#{method}\", \"request\": \"#{request}\", \"call\": \"#{call}\" }"
    yield
  end

  def client_streamer(call:, method:)
    @logger.info "{ \"method\": \"#{method}\", \"call\": \"#{call}\" }"
    yield
  end

  def server_streamer(request:, call:, method:)
    @logger.info "{ \"method\": \"#{method}\", \"request\": \"#{request}\", \"call\": \"#{call}\" }"
    yield
  end

  def bidi_streamer(requests:, call:, method:)
    @logger.info "{ \"method\": \"#{method}\", \"request\": \"#{requests}\", \"call\": \"#{call}\" }"
    yield
  end
end

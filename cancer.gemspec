lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'cancer'
  spec.version       = '0.0.1'
  spec.authors       = ['k-michikawa']
  spec.summary       = 'gRPC Ruby overview'
  spec.description   = 'gRPC'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ['lib']
  spec.platform      = Gem::Platform::RUBY

  spec.add_development_dependency 'bundler', '~> 2.1.0'
  spec.add_development_dependency 'grpc-tools', '~> 1.34.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_dependency 'activerecord', '~> 6.1.0'
  spec.add_dependency 'grpc', '~> 1.34.0'
  spec.add_dependency 'pg', '~> 1.2.3'
end

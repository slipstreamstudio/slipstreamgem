# -*- encoding: utf-8 -*-
version = File.read(File.expand_path("../SLIPSTREAM_VERSION",__FILE__)).strip

lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name        = "slipstream"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Lawrence Curtis"]
  s.email       = ["lawrence@slipstreamstudio.com"]
  s.homepage    = "http://www.slipstreamstudio.com"
  s.summary     = %q{Server setup, deploy and backup}
  s.description = %q{Does what it says on the tin}
  s.version     = version
  
  s.required_ruby_version     = '>= 1.8.7'
  s.required_rubygems_version = ">= 1.3.6"

  # Man files are required because they are ignored by git
  s.files              = `git ls-files`.split("\n")
  s.executables        = %w(slipstream)
  s.default_executable = "slipstream"
  s.require_paths      = ["lib"]
end
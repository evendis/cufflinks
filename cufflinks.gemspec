# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cufflinks/version'

Gem::Specification.new do |spec|
  spec.name          = "cufflinks"
  spec.version       = Cufflinks::VERSION
  spec.authors       = ["Paul Gallagher"]
  spec.email         = ["paul@evendis.com"]
  spec.description   = %q{A common user framework for Rails}
  spec.summary       = %q{A common user framework for Rails}
  spec.homepage      = "https://github.com/evendis/cufflinks"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "mongoid", "~> 3.0.9"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rdoc"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "rb-fsevent"

end

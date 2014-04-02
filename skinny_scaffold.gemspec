# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'skinny_scaffold/version'

Gem::Specification.new do |spec|
  spec.name          = "skinny_scaffold"
  spec.version       = SkinnyScaffold::VERSION
  spec.authors       = ["RSL"]
  spec.email         = ["sconds@gmail.com"]
  spec.description   = %q{Skinny scaffolds for Rails 4}
  # spec.summary       = %q{}
  spec.homepage      = "https://github.com/rsl/skinny_scaffold"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'haml', '> 4.0'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end

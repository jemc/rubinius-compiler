# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rubinius-compiler/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Brian Shirai"]
  gem.email         = ["brixen@gmail.com"]
  gem.description   = %q{The bytecode compiler for the Rubinius virtual machine.}
  gem.summary       = %q{Rubinius virtual machine bytecode compiler.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rubinius-compiler"
  gem.require_paths = ["lib"]
  gem.version       = Rubinius::Compiler::VERSION

  gem.add_runtime_dependency      "redcard",  "~> 1.0"

  gem.add_development_dependency  "mspec", "~> 1.5"
  gem.add_development_dependency  "rake",  "~> 10.0"
end

# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.authors       = ["jpablobr"]
  gem.email         = ["xjpablobrx@gmail.com"]
  gem.description   = %q{Simple processes spawner that makes scripting UNIX pipes a breeze.}
  gem.summary       = %q{Simple processes spawner that makes scripting UNIX pipes a breeze.}
  gem.homepage      = "http://github.com/jpablobr/simple-spawner"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^test/})
  gem.name          = 'simple-spawn'
  gem.require_paths = ["lib"]
  gem.version       = '0.1.0'
end

# -*- encoding: utf-8 -*-
require File.expand_path('../lib/travelport/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Mikhail Bondar"]
  gem.email         = ["m.bondar@yahoo.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "travelport"
  gem.require_paths = ["lib"]
  gem.version       = Travelport::VERSION
  gem.add_development_dependency("rspec")
  gem.add_development_dependency("vcr")
  gem.add_dependency("activesupport")
  gem.add_dependency("savon")
end

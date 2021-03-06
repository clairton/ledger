$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ledger/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ledger"
  s.version     = Ledger::VERSION
  s.authors     = ["Clairton Rodrigo Heinzen"]
  s.email       = ["clairton.rodrigo@gmail.com"]
  s.homepage    = "http://github.com.br/clairton"
  s.summary     = "Active Record Ledger."
  s.description = "Ledger implementation for Active Record."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.4"

  s.add_dependency "rails-observers"

  s.add_dependency "schema_plus"

  s.add_development_dependency "sqlite3"

  s.add_development_dependency "pry-byebug"

  s.add_development_dependency 'rails_admin', '>= 0.6.2'

  s.add_development_dependency 'sass-rails', '>= 4.0.2'
end

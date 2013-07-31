$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simple_sign_in/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simple_sign_in"
  s.version     = SimpleSignIn::VERSION
  s.authors     = ["Izhar Gavish"]
  s.email       = ["izharg@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "Super simple login page"
  s.description = "Hides your app behind a simple login page. Intended to be used in staging or beta"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara-webkit'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'jquery-rails'

  s.test_files = Dir["spec/**/*"]
end

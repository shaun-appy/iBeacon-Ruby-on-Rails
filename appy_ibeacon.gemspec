$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "appy/ibeacon/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "appy_ibeacon"
  s.version     = Appy::Ibeacon::VERSION
  s.authors     = ["shaun_appysphere"]
  s.email       = ["shaun@appysphere.com"]
  s.homepage    = "http://appyhotel.com"
  s.summary     = "Appy::Ibeacon."
  s.description = "Appy::Ibeacon."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  # with default
  # s.add_dependency "rails", "~> 4.0.2"
  # s.add_dependency "deface"


  # in real app needs
  s.require_path = "lib"
  s.add_dependency "appy_core"
  s.add_dependency "appy_backend"

end

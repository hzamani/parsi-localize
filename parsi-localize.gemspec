$:.push File.expand_path('../lib', __FILE__)
require 'version'

Gem::Specification.new do |s|

  # Description Meta...
  s.name        = 'parsi-localize'
  s.version     = I18n::ParsiLocalize::VERSION
  s.platform    = Gem::Platform::RUBY
  s.author      = 'Hassan Zamani'
  s.email       = 'hsn.zamani@gmail.com'
  s.homepage    = 'http://github.com/hzamani/parsi_localize'
  s.summary     = 'Change I18n localize to use parsi digits and jalaly dates in farsi locale'
  s.description = 'Change I18n localize to use parsi digits and jalaly dates in farsi locale'


  # Load Paths...
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']


  # Dependencies (installed via 'bundle install')...
  s.add_development_dependency("bundler")
  s.add_development_dependency("rake")
  s.add_development_dependency("i18n")
  s.add_development_dependency("jalalidate")
end

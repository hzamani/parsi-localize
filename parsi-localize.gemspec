$:.push File.expand_path('../lib', __FILE__)
require 'version'

Gem::Specification.new do |s|

  # Description Meta...
  s.name        = 'parsi-localize'
  s.version     = Parsi::Localize::VERSION
  s.platform    = Gem::Platform::RUBY
  s.author      = 'Hassan Zamani'
  s.email       = 'hsn.zamani@gmail.com'
  s.homepage    = 'http://github.com/hzamani/parsi_localize'
  s.summary     = 'Enhance I18n#localize to use parsi digits and Jalali dates in Farsi locale'
  s.description = 'Enhance I18n#localize to use parsi digits and Jalali dates in Farsi locale'


  # Load Paths...
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']


  # Dependencies (installed via 'bundle install')...
  s.add_development_dependency("bundler")
  s.add_development_dependency("rake")
  s.add_dependency("i18n")
  s.add_dependency("parsi-digits", ">= 0.3")
  s.add_dependency("parsi-date", ">= 0.2.2")
end

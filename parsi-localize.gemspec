$:.push File.expand_path('../lib', __FILE__)
require 'version'

Gem::Specification.new do |s|

  # Description Meta...
  s.name        = 'parsi-localize'
  s.version     = Parsi::Localize::VERSION
  s.platform    = Gem::Platform::RUBY
  s.licenses    = ['MIT']
  s.author      = 'Hassan Zamani'
  s.email       = 'hsn.zamani@gmail.com'
  s.homepage    = 'http://github.com/hzamani/parsi_localize'
  s.summary     = 'Enhence I18n#localize for Farsi locale'
  s.description = 'Enhance I18n#localize to use parsi digits and Jalali dates in Farsi locale'


  # Load Paths...
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']


  # Dependencies (installed via 'bundle install')...
  s.add_development_dependency("bundler", "~> 1.7")
  s.add_development_dependency("rake", "~> 0.9")
  s.add_dependency("i18n", "~> 0.7")
  s.add_dependency("parsi-digits", "~> 0.3")
  s.add_dependency("parsi-date", "~> 0.3")
end

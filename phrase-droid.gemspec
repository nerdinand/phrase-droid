# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','phrase-droid','version.rb'])
spec = Gem::Specification.new do |s|
  s.name = 'phrase-droid'
  s.version = PhraseDroid::VERSION
  s.author = 'Fabian Mettler'
  s.email = 'mettler.fabian@gmail.com'
  s.homepage = 'http://maveonair.io'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Push and Pull your PhraseApp translations for Android'
  s.licenses = ['MIT']
  s.files = `git ls-files`.split("
")
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.md']
  s.rdoc_options << '--title' << 'phrase-droid' << '--main' << 'README.md' << '-ri'
  s.bindir = 'bin'
  s.executables << 'phrase-droid'
  s.add_development_dependency('rake', '~> 10.3')
  s.add_development_dependency('rdoc', '~> 4.1')
  s.add_development_dependency('pry', '~> 0.9')
  s.add_runtime_dependency('gli', '2.11.0')
  s.add_runtime_dependency('httparty', '~> 0.13')
  s.add_runtime_dependency('toml', '~> 0.0')
  s.add_runtime_dependency('rainbow', '~> 2.0')
end

require 'rubygems'
require 'rubygems/gem_runner'
require 'rake/gempackagetask'

spec = Gem::Specification.new do |s|
  s.name = "dagen"
  s.version = "0.0.4"
  s.author = "Miquel Oliete"
  s.email = "miquel@miqueloliete.com"
  s.homepage = "https://github.com/mob1970/dagen"
  s.platform = Gem::Platform::RUBY
  s.summary = "A gem for generating test data."
  s.files = FileList["lib/dagen/generators/*.rb", "lib/dagen/items/*.rb"].to_a
  s.require_path = ['lib/dagen/items', 'lib/dagen/generators']
  s.autorequire = "dagen"
  s.test_files = FileList["{test}/**/*test.rb"].to_a
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.rdoc"]
end
 
Rake::GemPackageTask.new(spec) do |pkg| 
  pkg.need_tar = true 
end 
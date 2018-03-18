$LOAD_PATH.unshift 'lib'
package_name = File.realpath(File.dirname(__FILE__)).split('/').last
lib_name = package_name.gsub '-', '_'
require lib_name


Gem::Specification.new do |s|
  s.name        = package_name
  s.version     = '0.0.1'
  s.authors     = ['Daniel Pepper']
  s.summary     = 'thing_or_things'
  s.description = 'Making gets and multigets one and the same'
  s.homepage    = "https://github.com/dpep/rb_#{lib_name}"
  s.license     = 'MIT'

  s.files       = Dir.glob('lib/**/*')
  s.test_files  = Dir.glob('test/**/test_*')

  s.add_development_dependency 'rake', '~> 10'
  s.add_development_dependency 'minitest', '~> 5'
  s.add_development_dependency 'byebug', '~> 9'
  s.add_development_dependency 'awesome_print', '~> 1'
end

Gem::Specification.new do |s|
  s.name        = 'thing_or_things'
  s.version     = '0.0.1'
  s.authors     = ['Daniel Pepper']
  s.summary     = 'ThingOrThings'
  s.description = 'Making gets and multigets one and the same'
  s.homepage    = 'https://github.com/dpep/rb_thing_or_things'
  s.license     = 'MIT'

  s.files       = Dir.glob('lib/**/*')
  s.test_files  = Dir.glob('test/**/test_*')

  s.add_development_dependency 'rake', '~> 10'
  s.add_development_dependency 'minitest', '~> 5'
  s.add_development_dependency 'byebug', '~> 9'
  s.add_development_dependency 'awesome_print', '~> 1'
end

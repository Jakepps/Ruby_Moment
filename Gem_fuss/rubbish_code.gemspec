Gem::Specification.new do |spec|
  spec.name        = 'rubbish_code'
  spec.version     = '0.1.2'
  spec.authors     = ['Jake Epps']
  spec.email       = 'nullexp.team@gmail.com'
  spec.summary     = 'Student App'
  spec.description = 'А gem that allows you to get pass for patterns'
  spec.homepage    = 'https://github.com/Jakepps/Ruby_Moment'
  spec.license     = 'MIT'

  spec.files       = Dir["lib/*", "LICENSE.txt", "README.md"]
  spec.require_paths = ['lib']

  spec.add_dependency 'win32api'
end

Gem::Specification.new do |spec|
  spec.name        = 'rubbish_code'
  spec.version     = '0.1.3'
  spec.authors     = ['Jake Epps']
  spec.email       = 'nullexp.team@gmail.com'
  spec.summary     = 'Student App'
  spec.description = 'А gem that allows you to get pass for patterns'
  spec.homepage    = 'https://github.com/Jakepps/Ruby_Moment'
  spec.license     = 'MIT'

  spec.files       = Dir['controllers/*']
  spec.files       += Dir['db_config/migrations/*'] + Dir['db_config/config.yaml']
  spec.files       += Dir['models/*']
  spec.files       += Dir['repositories/*']
  spec.files       += Dir['util/*']
  spec.files       += Dir['LICENSE.txt'] + Dir['Documentation.md'] + Dir['README.md']
  spec.required_ruby_version = '>= 3.0'
  spec.add_dependency 'win32api'
end

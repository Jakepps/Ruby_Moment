# frozen_string_literal: true

require_relative "lib/rubbish_code/version"

Gem::Specification.new do |spec|
  spec.name = "rubbish_code"
  spec.version = RubbishCode::VERSION
  spec.authors = ["Jake Epps"]
  spec.email = ["nullexp.team@gmail.com"]
  spec.summary = "Student App"
  spec.description = "А gem that allows you to get pass for patterns"
  spec.homepage = "https://github.com/Jakepps/Ruby_Moment"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"
  spec.add_dependency 'win32api'
  spec.files = Dir.glob("**/*")
end

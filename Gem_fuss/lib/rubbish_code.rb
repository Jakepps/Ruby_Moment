# frozen_string_literal: true

require_relative "rubbish_code/version"

module RubbishCode
  Dir[File.dirname(__FILE__) + '/source/**/*.rb'].each { |file|
    puts file
    require file
  }
end

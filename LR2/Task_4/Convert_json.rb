require 'json'
require_relative 'Converter'

class ConverterJSON < Converter
	public_class_method :new

	def convert_read(file_content)
		JSON.parse(file_content, {symbolize_names: true})
	end

	def convert_write(hash_students)
		JSON.pretty_generate(hash_students)
	end

end
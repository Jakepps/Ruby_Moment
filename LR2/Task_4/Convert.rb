class Convert
	private_class_method :new

	def convert_read(file_content)
		raise NotImplementedError, 'Abstract class!'
	end

	def convert_write(hash_students)
		raise NotImplementedError, 'Abstract class!'
	end
end
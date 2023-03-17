class Students_list_txt < Data_list
    attr_accessor :file_path
  
    def initialize(file_path, data_list = nil)
      @file_path = file_path
      data = []
      if File.exist?(@file_path)
        File.open(@file_path, "r") do |f|
          f.each_line do |line|
            student_data = line.strip.split(',')
            data << Student.new(id: student_data[0], last_name: student_data[1], first_name: student_data[2], surname: student_data[3], git: student_data[4], telegram: student_data[5], mail: student_data[6], phone: student_data[7])
          end
        end
      end
      super(data)
    end
  
    def write_to_file
      File.open(@file_path, "w") do |f|
        @data.each do |student|
          f.puts "#{student.id},#{student.last_name},#{student.first_name},#{student.surname},#{student.phone},#{student.telegram},#{student.email},#{student.git}"
        end
      end
    end
  
    def get_student_by_id(id)
      @data.find { |student| student.id == id }
    end
  
    def get_k_n_student_short_list(k, n, data_list = nil, student_f=Student)
      data = @data[k..(k + n - 1)].map { |student| Student_short.new(id: student.id, last_name: student_f.last_name, initials: student.initials, git: student.git, contact: student.contact) }
      if data_list.nil?
        DataListStudentShort.new(data)
      else
        data_list.data = data
        data_list
      end
    end
  
    def sort_by_last_name_initials
      @data.sort_by! { |student| [student.last_name, student.first_name, student.surname] }
    end
  
    def add_student(student)
      max_id = @data.map { |s| s.id.to_i }.max
      student.id = (max_id + 1).to_s
      @data << student
    end
  
    def replace_student(id, student)
      student.id = id
      @data.map! { |s| s.id == id ? student : s }
    end
  
    def delete_student(id)
      @data.delete_if { |student| student.id == id }
    end
  
    def get_student_short_count
      @data.length
    end
end
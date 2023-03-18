require 'json'
require 'yaml'
require_relative '../task3/Data_list.rb'
require_relative 'convert'

class Students_list_txt < Convert
    attr_accessor :file_path
  
    def convert_read(data)
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
  
    def convert_write(hash_students)
      string_arr = hash_students.map do |hash|
        hash.map{|k,v| "#{k}:#{v}"}.join(',')
      end.join("\n")
    end
  
    def get_student_by_id(id)
      @data.find { |student| student.id == id }
    end
    
    # список k по счету n объектов класса Student_short 
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

class Students_list_JSON < Convert
  def initialize(file_path)
    @file_path = file_path
    @students = []

    if File.exist?(file_path)
      read_from_file
    else
      write_to_file
    end
  end

  def get_k_n_student_short_list(k, n, data_list = nil)
    data = @students[k...k+n].map { |s| s[:student] }
    if data_list
      data_list.data = data
      data_list
    else
      Data_list.new(data)
    end
  end

	def convert_write(hash_students)
		JSON.pretty_generate(hash_students)
	end

	def convert_read(file_content)
		JSON.parse(file_content, {symbolize_names: true})
	end

  def add_student(student)
    student_id = @students.empty? ? 1 : @students.last[:id] + 1
    @students << { id: student_id, student: student }
    write_to_file
  end

  def replace_student(student_id, student)
    student_index = @students.index { |s| s[:id] == student_id }
    @students[student_index][:student] = student if student_index
    write_to_file
  end

  def delete_student(student_id)
    @students.delete_if { |s| s[:id] == student_id }
    write_to_file
  end

  def get_student(student_id)
    student = @students.find { |s| s[:id] == student_id }
    student[:student] if student
  end

  def sort_by_surname_initials
    @students.sort! do |a, b|
      student_a = a[:student]
      student_b = b[:student]
      if student_a.surname == student_b.surname
        student_a.first_name <=> student_b.first_name
      else
        student_a.surname <=> student_b.surname
      end
    end
    write_to_file
  end

  def get_student_short_count
    @students.count
  end
end

class Students_list_YAML < Convert
    def initialize(file_path = "students_ex.yml")
        super()
        @file_path = file_path
        @students = []
        if File.exists?(file_path)
        @students = YAML.load_file(file_path)
        end
    end

    def add(student)
        new_id = (@students.map { |s| s.id.to_i }.max || 0) + 1
        student.id = new_id.to_s
        @students << student
        write_to_file
    end

    def delete(student_id)
        student = get(student_id)
        @students.delete(student)
        write_to_file
    end
    
    def convert_read(file_content)
      YAML.safe_load(file_content).map{ |h| h.transform_keys(&:to_sym)}
    end

    def convert_read(file_content)
      YAML.safe_load(file_content).map{ |h| h.transform_keys(&:to_sym)}
    end

    def replace(student)
        delete(student.id)
        add(student)
    end

    def sort_by_full_name
        @students.sort_by! { |s| [s.surname, s.first_name, s.patronymic] }
        write_to_file
    end

    def get(student_id)
        @students.find { |s| s.id == student_id }
    end

    def get_k_n_student_short_list(n, k, data_list = nil)
        students_data = YAML.load_file(filename)
        student_list = students_data.map { |data| Student_short.new(id: data.id, surname: "#{data.surname} #{data.first_name[0]}.") }
        short_list = student_list.drop(n - 1).take(k)
        Data_list.new(short_list)
    end
    
    def get_student_short_count
        @students.count
    end
end
require 'json'
require 'yaml'

class Student
    attr_accessor :id, :name, :age, :email

    def initialize(id, name, age, email)
      @id = id
      @name = name
      @age = age
      @email = email
    end
end

class StudentShort
    attr_accessor :id, :name

    def initialize(id, name)
      @id = id
      @name = name
    end
end


class StudentList
  DB_NAME  = 'students.db'.freeze

  def initialize
    @source= SQLite3::Database.new(DB_NAME)
    @students = adapter.get_students
    create_table
  end

  def create_table
    @db.execute <<-SQL
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        age INTEGER,
        gender TEXT
      );
    SQL
  end

  def adapter
    if @source.include?('.txt')
      TxtAdapter.new(@source)
    elsif @source.include?('.json')
      JSONAdapter.new(@source)
    elsif @source.include?('.yml')
      YamlAdapter.new(@source)
    else
      raise "Неверный формат файла"
    end
  end

  def add_student(student)
    id = @db.last_insert_row_id + 1
    @db.execute("INSERT INTO students (id, name, age, gender) VALUES (?, ?, ?, ?)", id, student.name, student.age, student.gender)
    student.id = id
    adapter.save_students(students)
  end

  def replace_student(student)
    @db.execute("UPDATE students SET name = ?, age = ?, gender = ? WHERE id = ?", student.name, student.age, student.gender, student.id)
    adapter.save_students(student)
  end

  def delete_student(id)
    @db.execute("DELETE FROM students WHERE id = ?", id)
  end

  def get_k_n_student_short_list(k, n)
    rows = @db.execute("SELECT id, name FROM students ORDER BY id LIMIT #{n} OFFSET #{(k-1)*n}")
    data_list = Data_list.new
    rows.each do |row|
      student_short = Student_short.new(row[0], row[1])
      data_list.add(student_short)
    end
    data_list
  end

  def get_student_short_count
    @students.count
  end

  def save_students(students)
    File.open(@file_path, "w") do |file|
      students.each do |student|
        file.puts "#{student.id},#{student.name},#{student.age},#{student.email}"
      end
    end
  end

end

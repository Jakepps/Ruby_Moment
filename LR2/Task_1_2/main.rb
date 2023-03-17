require_relative 'student'

student1 = Student.new(id: 1, last_name: "Хахук", name: "Рустам", phone: "9(999)999-99-99", telegram: "delta_null", git: "https://github.com/delta_null")
puts student1.get_info()

student2 = Student.new(id: 2, last_name: "Нагалевский", name: "Артем", surname: "Михайлович", email: "nagalevskiy@mail.ru", git: "https://github.com/jakepps")
puts student2.get_info()

student3 = Student.new(id: 3, last_name: "Волков", name: "Серега", telegram: "starproxima", git: "https://github.com/starproxima")
puts student3.get_info()

begin
    students = Student.read_from_txt('test.txt')
    
    students.each do |student|
        puts "#{student.get_info}"
    end
end

students = [
    Student.new('Иванов', 'Иван', 'Иванович', '79991234567', '@ivanov', 'ivanov@mail.ru', 'ivanov'),
    Student.new('Петров', 'Петр', 'Петрович', '79992345678', '@petrov', 'petrov@mail.ru', 'petrov'),
    Student.new('Сидоров', 'Сидор', 'Сидорович', '79993456789', '@sidorov', 'sidorov@mail.ru', 'sidorov')
  ]
  
# Запись списка объектов в файл
file_path = './students.txt'
Student.write_to_txt(file_path, students)

puts Student.valid_phone?('+7918673844488')
puts Student.valid_telegram?('mfewef')
puts Student.valid_email?('mfewef@yfa.ru')
puts Student.valid_git?('https://github.com/StarProxima')

short_stud1 = Student_short.from_student(student1)
puts short_stud1

short_stud2 = Student_short.new(0, 'jjhj', 'git', 'contact')
puts short_stud2
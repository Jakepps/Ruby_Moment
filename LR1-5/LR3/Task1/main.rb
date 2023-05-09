require 'sqlite3'
require_relative 'Student_list_DB.rb'
require_relative 'Work_with_db.rb'

# Создаем объект класса Students_list_db
students_list = Students_list_DB.new('students.db')

# Получаем студента по ID
student1 = students_list.get_student(1)

# Создаем нового студента
new_student = Student.new(name: 'Mary', age: 22, gender: 'Female')

# Добавляем нового студента в список
students_list.add_student(new_student)

# Заменяем данные студента с id=2
student2 = students_list.get_student(2)
student2.name = 'Smith'
students_list.replace_student(student2)

# Удаляем студента с id=3
students_list.delete_student(3)

# Получаем количество студентов в списке
num_students = students_list.count_students
puts(num_students)
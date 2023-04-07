require 'sqlite3'
require_relative 'Create_seed_table.rb'

db = SQLite3::Database.new('student.db')

Student.create_table(db)
Student.seed(db)

rust = Student.new({ name: 'Rustam', age: 20, gender: 'Male' })
gir = Student.new({ name: 'Gireka', age: 21, gender: 'Male' })
art = Student.new({ name: 'Artem', age: 19, gender: 'Male' })

puts rust.gender 
puts gir.age 
puts art.name 
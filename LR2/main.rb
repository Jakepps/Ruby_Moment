require_relative 'student'

student1 = Student.new(id: 1, last_name: "Хахук", name: "Рустам", phone: "9(999)999-99-99", telegram: "delta_null", git: "https://github.com/delta_null")
puts student1

student2 = Student.new(id: 2, last_name: "Нагалевский", name: "Артем", surname: "Михайлович", email: "nagalevskiy@mail.ru", git: "https://github.com/jakepps")
puts student2

student3 = Student.new(id: 3, last_name: "Волков", name: "Серега", telegram: "starproxima", git: "https://github.com/starproxima")
puts student3
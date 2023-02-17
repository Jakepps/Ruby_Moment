require_relative 'LR2_1'

students = [
    Student.new(id: '1', surname: 'Artem', first_name: 'Nagalevskiy', patronymic: 'Mich', phone:'89187482999', telegram: 'StarPRoxima', mail:'chatGPT@mail.ru', git: 'https://github.com/Jakepps'),
    Student.new(id: '2', surname: 'Danil', first_name: 'Girenko', patronymic: 'Evg', phone:'89187482999', telegram: 'StarPRoxima', mail:'chatGPT@mail.ru', git: 'https://github.com/Jakepps'),
    Student.new(id: '3', surname: 'Sergay', first_name: 'Prozorov', patronymic: 'Ser', phone:'89187482999', telegram: 'StarPRoxima', mail:'chatGPT@mail.ru', git: 'https://github.com/Jakepps'),
    Student.new(id: '4', surname: 'Rustam', first_name: 'Khahik', patronymic: 'Nal', phone:'89187482999', telegram: 'StarPRoxima', mail:'chatGPT@mail.ru', git: 'https://github.com/Jakepps'),
    Student.new(id: '5', surname: 'Sergey', first_name: 'Danilkov', patronymic: 'Al', phone:'89187482999', telegram: 'StarPRoxima', mail:'chatGPT@mail.ru', git: 'https://github.com/Jakepps')
]
 
puts(Student.get_git(1))
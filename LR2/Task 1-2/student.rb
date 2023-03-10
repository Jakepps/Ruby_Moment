class Student
  attr_accessor :id, :last_name, :name, :surname, :contacts
  
  def initialize(id:, last_name:, name:, surname: nil, contacts: {})
    @id = id
    @last_name = last_name
    @name = name
    @surname = surname
    @contacts = contacts
    validate
  end

  def to_s
    "Студент №#{id}: #{last_name} #{name} #{surname}.\n Телефон: #{phone}, Телеграм: #{telegram}, Почта: #{email}, Git: #{git}"
  end

  def self.from_string(string)
    id, last_name, first_name, surname, phone, telegram, email, git = string.split(',')
    contacts = { phone: phone, telegram: telegram, mail: email, git: git }
    new(id: id, last_name: last_name, first_name: first_name, surname: surname, contacts: contacts)
  end

  def initials
    "#{@first_name[0]}.#{@surname[0]}." if @first_name && @surname
  end

  def set_contacts(contacts)
    contacts.each do |key, value|
        case key.to_sym
        when :phone
          self.phone = value
        when :telegram
          self.telegram = value
        when :mail
          self.mail = value
        else
        raise ArgumentError, "Недопустимый тип контакта: #{key}"
        end
    end
  end

  def get_info
    "#{last_name} #{initials}; GitHub: #{github}, Email: #{get_contact()}"
  end

  def get_contact
    info = ""
    if phone
      info += " Phone: #{phone}"
    end
    if telegram
      info += " Telegram: #{telegram}"
    end
    if email
      info += " Mail: #{email}"
    end
    info
  end 

  #это сеттер телефона
  def phone=(value)
    if self.class.valid_phone?(value)
      @phone = value
    else
      raise ArgumentError, "Недопустимый формат телефонного номера"
    end
  end

  def validate
    validate_git
    validate_contact
  end

  def validate_git
    if git.nil? || git.empty? || git.match?(/\Ahttps:\/\/github\.com\/[a-zA-Z0-9]+\z/)
    raise ArgumentError, "URL-адрес GitHub не может быть пустым или вы ввели его неправильно"
    end
  end

  def validate_contact
    if phone.nil? && telegram.nil? && mail.nil? && phone.match?(/\A(\+)?(\d|\s){10,}\z/) && telegram.match?(/\A[a-zA-Z0-9]+\z/) && email.match?(/\A[a-zA-Z0-9]+@[a-z]+.[a-z]+\z/)
    raise ArgumentError, "Должен быть предусмотрен по крайней мере один способ связи и они должны быть верно написаны, проверьте правилльность данных"
    end
  end
  
  def self.valid_phone?(phone)
    phone.nil? || phone.is_a?(String) && phone.match?(/\A(\+)?(\d|\s){10,}\z/)
  end

  # def self.valid_telegram?(telegram)
  #   telegram.nil? || telegram.is_a?(String) && telegram.match?(/\A[a-zA-Z0-9]+\z/)
  # end

  # def self.valid_email?(email)
  #   email.nil? || email.is_a?(String) && email.match?(/\A[a-zA-Z0-9]+@[a-z]+.[a-z]+\z/)
  # end

  # def self.valid_git?(git)
  #   git.nil? || git.is_a?(String) && git.match?(/\Ahttps:\/\/github\.com\/[a-zA-Z0-9]+\z/)
  # end

  def self.read_from_txt(file_path)
    students = []
    begin
      File.foreach(file_path) do |line|
        students << from_string(line.strip)
      end
      students
    rescue => exception
      raise "Файл не найден по указанному адресу #{file_path}. Исключение: #{exception.message}"
    end
  end

  def self.write_to_txt(file_path, students)
    begin
      File.open(file_path, 'w') do |file|
        students.each do |student|
          file.puts student.to_s
        end
      end
    rescue => exception
      raise "Ошибка записи в файл по указанному адресу#{file_path}. Исключение: #{exception.message}"
    end
  end

end


#короткий стюдент, перенес в главный файл
class Student_short < Student
  attr_reader :id, :surname_initials, :git, :contact

  def initialize(id, surname_initials, git, contact)
    super({id: id, git: git})
    @surname_initials = surname_initials
    @contact = contact
  end

    
  def self.from_student(student)
    surname_initials = "#{student.last_name} #{student.first_name[0]}.#{student.surname[0]}."
    contact = student.get_contact()

    new(student.id, surname_initials, student.git, contact)
  end

  def to_s
    "ID: #{id}, Фамилия, инициалы: #{surname_initials}, Git: #{git}, Contacts: #{contact}"
  end

  def id=(_)
    raise ReadOnlyError, "Не удается установить атрибут, доступный только для чтения: id"
  end

  def surname_initials=(_)
    raise ReadOnlyError, "Не удается установить атрибут, доступный только для чтения: surname_initials"
  end

  def git=(_)
    raise ReadOnlyError, "Не удается установить атрибут только для чтения: git"
  end

  def contact=(_)
    raise ReadOnlyError, "Не удается установить атрибут, доступный только для чтения: контакт"
  end
end

#блок с наследованием
#базированный гигачад- родительский класс 
class StudentBase 
  attr_reader :id, :name, :surname, :github, :contact
  
  def initialize(id:, name:, surname:, github:, contact:)
    @id = id
    @name = name
    @surname = surname
    @github = github
    @contact = contact
  end
  
  def info
    "#{surname} #{name[0]}. #{github}, #{contact}"
  end
end

#добавим группу 
class Student < StudentBase
  attr_accessor :group

  def initialize(id:, name:, surname:, github:, contact:, group:)
      super(id: id, name: name, surname: surname, github: github, contact: contact)
      @group = group
  end
end

class StudentShort < StudentBase
  def initialize(id:, name:, surname:, github:, contact:)
      super(id: id, name: name, surname: surname, github: github, contact: contact)
  end
end
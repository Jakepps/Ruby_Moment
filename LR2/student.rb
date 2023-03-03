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

  def set_contacts(phone: nil, telegram: nil, email: nil)
    self.phone = phone if phone
    self.telegram = telegram if telegram
    self.email = email if email
  end

  def getInfo
    "#{last_name} #{initials}; GitHub: #{github}, Email: #{contact}"
  end

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
  
  def validate
    unless self.git
      raise ArgumentError.new("Не заполнено поле Git")
    end
    unless self.phone || self.telegram || self.email
      raise ArgumentError.new("Не заполнено ни одно поле для связи")
    end
  end

  def self.validate(last_name, initials, github, contact)
    raise ArgumentError, "Неверная фамилия: #{last_name}" unless valid_lastname?
    
    raise ArgumentError, "Неверные инициалы: #{initials}" unless valid_initials?
    
    raise ArgumentError, "Неверный GitHub: #{github}" unless valid_github?
    
    raise ArgumentError, "Неверные контактные данные: #{contact}" unless valid_contact?
  end

  def valid_lastname?
    contacts[:last_name].to_s.match?(/^\p{L}+$/)
  end

  def valid_initials?
    contacts[:initials].to_s.match?(/^[А-Я]\.[А-Я]\.$/)
  end

  def valid_github?
    contacts[:github].to_s.match?(/\Ahttps?:\/\/github\.com\/[a-zA-Z0-9]+\/[a-zA-Z0-9]+\z/)
  end

  def valid_contact?
    contacts[:contact].to_s.match?(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
  end

end
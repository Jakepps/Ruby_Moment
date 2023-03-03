class Student
  attr_accessor :id, :last_name, :name, :surname, :phone, :telegram, :email, :git
  
  def initialize(id:, last_name:, name:, surname: nil, phone: nil, telegram: nil, email: nil, git: nil)
    @id = id
    @last_name = last_name
    @name = name
    @surname = surname
    @phone = phone
    @telegram = telegram
    @email = email
    @git = git
  end

  def to_s
    "Студент №#{id}: #{last_name} #{name} #{surname}.\n Телефон: #{phone}, Телеграм: #{telegram}, Почта: #{email}, Git: #{git}"
  end

  def self.from_string(str)
    # Регулярное выражение для парсинга строки вида "Фамилияб, инициалы ,гит, контакты"
    regex = /^(\S+)\s+(\S\.\S\.)\s+(\S+),\s+(.*)$/
    match = regex.match(str)
    
    raise ArgumentError, "Неверный формат строки: #{str}" unless match
    
    last_name = match[1]
    initials = match[2]
    github = match[3]
    contact = match[4]
    
    # Проверка валидности данных
    validate(last_name, initials, github, contact)
    
    # Вызов стандартного конструктора с полученными параметрами
    self.new(last_name, initials, github, contact)
  end

  def validate
    unless self.git
      raise ArgumentError.new("Не заполнено поле Git")
    end
    unless self.phone || self.telegram || self.email
      raise ArgumentError.new("Не заполнено ни одно поле для связи")
    end
  end

  def self.valid_phone?(phone)
    phone.to_s.gsub(/\D/, '').match?(/^((\+7|7|8)+([0-9]){10})$/)
  end

  def self.validate(last_name, initials, github, contact)
    raise ArgumentError, "Неверная фамилия: #{last_name}" unless last_name =~ /^\p{L}+$/
    
    raise ArgumentError, "Неверные инициалы: #{initials}" unless initials =~ /^[А-Я]\.[А-Я]\.$/
    
    raise ArgumentError, "Неверный GitHub: #{github}" unless github =~ /^[a-z\d](?:[a-z\d]|-(?=[a-z\d])){0,38}$/i
    
    raise ArgumentError, "Неверные контактные данные: #{contact}" unless contact =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  end

  def set_contacts(phone: nil, telegram: nil, email: nil)
    self.phone = phone if phone
    self.telegram = telegram if telegram
    self.email = email if email
  end
end
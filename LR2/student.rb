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

  def self.valid_phone?(phone)
    phone.to_s.gsub(/\D/, '').match?(/^((\+7|7|8)+([0-9]){10})$/)
  end

  def validate
    unless self.git
      raise ArgumentError.new("Не заполнено поле Git")
    end
    unless self.phone || self.telegram || self.email
      raise ArgumentError.new("Не заполнено ни одно поле для связи")
    end
  end

  def set_contacts(phone: nil, telegram: nil, email: nil)
    self.phone = phone if phone
    self.telegram = telegram if telegram
    self.email = email if email
  end
end
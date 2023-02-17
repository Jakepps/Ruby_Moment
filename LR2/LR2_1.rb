class Student
    attr_accessor :id, :surname, :first_name, :patronymic, :phone, :telegram, :mail, :git, :initials
  
    def initialize(options = { surname: '', first_name: '', patronymic: '' })
      @id = options[:id]
      @surname = options[:surname]
      @first_name = options[:first_name]
      @patronymic = options[:patronymic]
      @phone = options[:phone]
      @telegram = options[:telegram]
      @mail = options[:mail]
      @git = options[:git]
      @initials = "#{first_name[0]}.#{surname[0]}.#{patronymic[0]}."
    end

    def get_info
      info = "#{surname} #{initials}."
      info += " Git: #{git}" if git
      if phone
        info += " Phone: #{phone}"
      elsif telegram
        info += " Telegram: #{telegram}"
      elsif mail
        info += " Mail: #{mail}"
      end
      info
    end

    def get_id
      @id
    end

    def get_surname
      @surname
    end

    def get_names
      names = ""
      names += "#{@surname} " if @surname
      names += "#{@first_name} " if @first_name
      names += "#{@patronymic}" if @patronymic
      names
    end

    def get_initials
      "#{@first_name[0]}.#{@patronymic[0]}." if @first_name and @patronymic
    end

    def get_git
      @git
    end

    def to_s
      "ID: #{id}, Surname: #{surname}, First name: #{first_name}, Patronymic: #{patronymic}, Phone: #{phone}, Telegram: #{telegram}, Mail: #{mail}, Git: #{git}"
    end

    def self.valid_phone?(phone)
      phone.is_a?(String) && phone.match(/\A[0-9]+\z/)
    end
    
    def self.valid_telegram?(telegram)
      telegram.is_a?(String) && telegram.match(/\A[a-zA-Z0-9]+\z/)
    end
 
    def self.valid_mail?(mail)
      mail.is_a?(String) && mail.match(/\A[a-zA-Z0-9]+@[a-z]+.[a-z]+\z/)
    end
    
    def self.valid_git?(git)
      git.is_a?(String) && git.match(/\Ahttps?:\/\/github\.com\/[a-zA-Z0-9]+\/[a-zA-Z0-9]+\z/)
    end
     
    def set_contacts(params = { phone: '', telegram: ''})
      @phone = params[:phone] if self.class.valid_phone?(params[:phone])
      @telegram = params[:telegram] if self.class.valid_telegram?(params[:telegram])
    end
    
    def validate_contact
      raise ArgumentError, 'A contact for communication is required' unless (git || phone || telegram || mail)
    end
end
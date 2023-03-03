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
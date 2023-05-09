# Паттерн Одиночка (Singleton) предназначен для создания объекта, который будет существовать только в единственном экземпляре
# В примере класс SingletonClass может иметь только один экземпляр. 
# При первом вызове метода instance создается новый объект SingletonClass, а при последующих вызовах возвращается тот же самый экземпляр.
# В данном случае singleton_obj1 и singleton_obj2 будут ссылаться на один и тот же объект SingletonClass.
# Это происходит потому, что метод instance всегда возвращает тот же самый экземпляр, который был создан при первом вызове.

class SingletonClass

    def self.instance
        @@instance ||= new
    end
  
    private_class_method :new
  
    def print_message
      puts "Hello, world!"
    end
end

singleton_obj1 = SingletonClass.instance
singleton_obj2 = SingletonClass.instance

puts singleton_obj1 == singleton_obj2 # выводит "true"

singleton_obj1.print_message # выводит "Hello, world!"

class AbstractClass
    def template_method
      step_one
      step_two
      step_three
    end
  
    private_class_method :new
  
    def step_one
      raise NotImplementedError, 'Этот метод должен быть реализован подклассом'
    end
  
    def step_two
      raise NotImplementedError, 'Этот метод должен быть реализован подклассом'
    end
  
    def step_three
      raise NotImplementedError, 'Этот метод должен быть реализован подклассом'
    end
end
  
class ConcreteClass < AbstractClass
    def step_one
      puts 'Первый шаг конкретного алгоритма'
    end
  
    def step_two
      puts 'Второй шаг конкретного алгоритма'
    end
  
    def step_three
      puts 'Третий шаг конкретного алгоритма'
    end
end
  
class Subclass < AbstractClass
    def step_one
      puts 'Первый шаг алгоритма подкласса'
    end
  
    def step_two
      puts 'Второй шаг алгоритма подкласса'
    end
end
  
# В этом примере AbstractClass является базовым классом, который определяет базовый алгоритм с
# `template_method` и абстрактные методы `step_one`, `step_two` и `step_three`.
# `Конкретный класс" расширяет AbstractClass и предоставляет конкретные реализации
# из всех абстрактных методов."Subclass" расширяет AbstractClass и переопределяет только
# методы `step_one` и `step_two`.


abstract = AbstractClass.new
abstract.template_method
#вызовет NotImplementedError для каждого абстрактного метода

concrete = ConcreteClass.new
concrete.template_method
#приведет к запуску конкретного алгоритма, реализованного конкретным классом

subclass = Subclass.new
subclass.template_method
# Это запустит алгоритм подкласса с конкретными шагами, переопределенными в подклассе
# Паттерн шаблона - это шаблон проектирования, используемый в объектно-ориентированном программировании (ООП)
# который определяет основные шаги алгоритма и позволяет подклассам переопределять некоторые
# из этих шагов без изменения общей структуры алгоритма.
# В Ruby шаблон метода Template может быть реализован с помощью следующих шагов:
#
# 1)Создайте абстрактный базовый класс, который определяет базовый алгоритм и объявляет
# методы, которые будут реализованы подклассами.
#
# 2)Определите конкретный класс, который реализует методы, объявленные базовым классом.
#
# 3)Определите подкласс, который расширяет базовый класс и переопределяет некоторые методы
# для предоставления конкретных реализаций.
#

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
  
# В этом примере `Абстрактный класс` является базовым классом, который определяет базовый алгоритм с
# `template_method` и абстрактные методы `step_one`, `step_two` и `step_three`.
# `Конкретный класс" расширяет "Абстрактный класс" и предоставляет конкретные реализации
# из всех абстрактных методов. Наконец, "Подкласс" расширяет `Абстрактный класс` и переопределяет только
# методы `step_one` и `step_two`.
#
# Затем вы можете использовать `template_method` каждого класса для запуска
# алгоритм с конкретными шагами, реализованными каждым подклассом:

abstract = AbstractClass.new
abstract.template_method
#вызовет NotImplementedError для каждого абстрактного метода

concrete = ConcreteClass.new
concrete.template_method
#приведет к запуску конкретного алгоритма, реализованного конкретным классом

subclass = Subclass.new
subclass.template_method
# Это запустит алгоритм подкласса с конкретными шагами, переопределенными в подклассе
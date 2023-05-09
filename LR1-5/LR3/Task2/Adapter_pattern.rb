# Паттерн Адаптер - позволяет объектам с несовместимыми интерфейсами работать вместе.
# Он позволяет обернуть один класс в адаптер, чтобы он выглядел для другого класса так,
# как будто он имеет другой интерфейс.
# Таким образом, адаптер преобразует интерфейс класса к другому интерфейсу, на который рассчитан клиент.

# Паттерн Адаптер может быть полезен, когда необходимо использовать классы, не совместимые с существующей системой,
# например, когда требуется использовать сторонний компонент или библиотеку.

class Celsius
    def initialize(temp)
      @temp = temp
    end

    def get_temp
      @temp
    end
end

class FahrenheitAdapter
    def initialize(celsius)
      @celsius = celsius
    end

    def get_temp
      (@celsius.get_temp * 9.0 / 5.0) + 32.0
    end
end

celsius = Celsius.new(25.0)
fahrenheit_adapter = FahrenheitAdapter.new(celsius)

puts fahrenheit_adapter.get_temp # 77.0

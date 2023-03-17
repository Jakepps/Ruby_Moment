#В этом примере определяем класс доставки, который использует определенную стратегию для расчета стоимости доставки на основе веса посылки.
#Класс Shipping принимает объект strategy в своем конструкторе и делегирует ему вычисление стоимости доставки с использованием метода calculate.

#Определяем интерфейс базовой стратегии доставки с помощью единого метода calculate, который реализуется конкретными стратегиями FlatRateShipping, FreeShipping и WeightBasedShipping.
#Каждая стратегия рассчитывает стоимость доставки на основе своей собственной логики.

#Создаем новый экземпляр Shipping с определенной стратегией и используем его для расчета стоимости доставки посылки весом 10. 
#Затем меняем стратегию во время выполнения и снова рассчитываем стоимость доставки, чтобы продемонстрировать гибкость шаблона стратегии.

#Определим класс контекста, который будет использовать стратегию
class Shipping
    attr_accessor :strategy
    
    def initialize(strategy)
      @strategy = strategy
    end
    
    def shipping_cost(weight)
      @strategy.calculate(weight)
    end
  end
  
  #Определим интерфейс базовой стратегии
  class ShippingStrategy
    def calculate(weight)
      raise NotImplementedError, 'Подклассы должны реализовывать этот метод'
    end
  end
  
  #Определим конкретные стратегии
  class FlatRateShipping < ShippingStrategy
    def calculate(weight)
      5.00
    end
  end
  
  class FreeShipping < ShippingStrategy
    def calculate(weight)
      0.00
    end
  end
  
  class WeightBasedShipping < ShippingStrategy
    def calculate(weight)
      weight * 0.10
    end
end
  
#Создадим новый экземпляр Shipping с определенной стратегией
shipping = Shipping.new(FlatRateShipping.new)
puts shipping.shipping_cost(10) #выведет 5.0

#Изменим стратегию во время выполнения
shipping.strategy = WeightBasedShipping.new
puts shipping.shipping_cost(10) #выведет 1.0
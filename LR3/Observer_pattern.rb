# Cуть паттерна наблюдатель заключается в создании механизма подписки на события,
# который позволяет автоматически уведомлять подписчиков об изменениях, происходящих в наблюдаемых объектах.
# Это упрощает реализацию сложных систем, где изменения в одном объекте могут приводить к изменениям в других объектах.

# Издатель
class Publisher
  attr_reader :subscribers

  def initialize
    @subscribers = []
  end

  def add_subscriber(subscriber)
    @subscribers << subscriber
  end

  def remove_subscriber(subscriber)
    @subscribers.delete(subscriber)
  end

  def notify_subscribers(message)
    @subscribers.each do |subscriber|
      subscriber.update(message)
    end
  end
end

# Подписчик
class Subscriber
  def update(message)
    puts "Получено сообщение: #{message}"
  end
end

# Создаем издателя и двух подписчиков
publisher = Publisher.new
subscriber1 = Subscriber.new
subscriber2 = Subscriber.new
subscriber3 = Subscriber.new

# Подписываем подписчиков на издателя
publisher.add_subscriber(subscriber1)
publisher.add_subscriber(subscriber2)
publisher.add_subscriber(subscriber3)

# Издатель отправляет сообщение всем подписчикам
publisher.notify_subscribers("Привет, мир для трех!")

puts("Удалим одного подписчика...")
publisher.remove_subscriber(subscriber2)
publisher.notify_subscribers("Привет, мир для двух!")

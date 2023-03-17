class Data_list
  attr_reader :selected

  def initialize(*elements)
    @data = elements.sort
    @frozen = true
    @selected = []
  end

  def [](index)
    @data[index]
  end

  def each(&block)
    @data.each(&block)
  end

  def size
    @data.size
  end

  def reverse!
    raise "Data_list заморожен" if @frozen
    @data.reverse!
  end

  def self.create(*elements)
    new(*elements)
  end

  def select(number)
    @selected << number
  end

  def get_selected
    @selected
  end

  def get_names
    raise NotImplementedError, "Должен быть реализован в подклассе"
  end

  def get_data
    raise NotImplementedError, "Должен быть реализован в подклассе"
  end
  
  def each
    @data.each { |element| yield element }
  end

  private

  attr_reader :data
end

class Data_list_2
  attr_reader :data

  private_class_method :new

  def initialize(data)
    @data = data
    @selected = []
  end

  def select(number)
    @selected << @data[number]
  end

  def selected
    @selected.map(&:id)
  end

  def each
    @data.each { |element| yield element }
  end

  def get_names
    raise NotImplementedError, "Подклассы должны реализовывать этот метод"
  end

  def get_data
    raise NotImplementedError, "Подклассы должны реализовывать этот метод"
  end

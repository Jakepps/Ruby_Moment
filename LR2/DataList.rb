class Data_list

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

end

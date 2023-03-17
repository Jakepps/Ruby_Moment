require_relative 'Data_List'

class Data_List_Student_Short < Data_List_2
  attr_reader :column_names
  attr_accessor :data

  def column_count
    @data[0].instance_variables.count
  end

  def row_count
    @data.count
  end

  def names
    %w[id surname initials git contact]
  end

  def select(number)
    @selected << @data[number].id
  end
end
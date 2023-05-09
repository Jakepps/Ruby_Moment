require_relative 'Data_List'

class Data_List_Student_Short < Data_List_2
  attr_reader :column_names
  attr_accessor :data

  def column_count
    @data[0].instance_variables.count
  end

  def select(number)
    @selected << @data[number].id
  end

  def get_names
    %w[git contact last_name_and_initials]
  end

  def get_data(obj)
    [obj.git, obj.contact, obj.last_name_and_initials]
  end
end
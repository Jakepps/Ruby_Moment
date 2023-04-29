# frozen_string_literal: true

require './university_lab/repositories/containers/data_table'

class DataList
  private_class_method :new

  attr_writer :objects

  def initialize(objects)
    self.objects = objects
    @listeners = []
  end

  def add_listener(listener)
    @listeners << listener
  end

  def remove_listener(listener)
    @listeners.delete(listener)
  end

  def notify
    @listeners.each { |lst| lst.on_datalist_changed(data_table) }
  end

  def select_element(number)
    self.selected_num = number < objects.size ? number : nil
  end

  def selected_id
    objects[selected_num].id
  end

  # Получить DataTable со всеми элементами.
  def data_table
    result = []
    counter = 0
    objects.each do |obj|
      row = []
      row << counter
      row.push(*table_fields(obj))
      result << row
      counter += 1
    end
    DataTable.new(result)
  end

  # Добавить элементы в конец списка
  def replace_objects(objects)
    self.objects = objects.dup
    notify
  end

  protected

  # Список значений полей для DataTable. Переопределить в наследниках
  def table_fields(_obj)
    []
  end

  # Имена атрибутов объектов по порядку. Переопределить в наследниках
  def column_names
    []
  end

  private

  attr_reader :objects
  attr_accessor :selected_num
end

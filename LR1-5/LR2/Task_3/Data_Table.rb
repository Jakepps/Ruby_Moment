class DataTable
    def initialize(data)
      @data = data
    end

    def get_element(row, col)
        @data[row][col]
    end

    def row_count
        @data.size
    end

    def column_count
        @data[0].size
    end
end

table = DataTable.new([
    ["a", "b", "c"],
    [1, 2, 3],
    [true, false, nil]
])

puts table.get_element(1, 2) # выводит значение элемента на пересечении второй строки и третьего столбца (3)
puts table.get_rows_count() # выводит количество строк в таблице (3)
puts table.get_columns_count() # выводит количество столбцов в таблице (3)
require 'fox16'

include Fox

class ListWindow < FXMainWindow
  def initialize(app)
    super(app, "Пример", :width => 400, :height => 200)

    @list_widget = FXList.new(self, nil, 0, LIST_SINGLESELECT|LAYOUT_FILL_X|LAYOUT_FILL_Y)
    @list_widget.appendItem("Список 1")
    @list_widget.appendItem("Список 2")
    @list_widget.appendItem("Список 3")

    @list_widget.connect(SEL_COMMAND) do |sender, selector, data|
      if sender == @list_widget
        selected_item = @list_widget.getItemText(@list_widget.currentItem)
        puts "Выберите список: #{selected_item}"
      end
    end

    close_button = FXButton.new(self, "Close", :opts => FRAME_RAISED|FRAME_THICK|LAYOUT_RIGHT|LAYOUT_TOP, :width => 100, :height => 30)
    close_button.connect(SEL_COMMAND) do
      self.close
    end

    # Вызываем метод show для отображения окна
    show(PLACEMENT_SCREEN)
  end
end

app = FXApp.new
ListWindow.new(app)
app.create
app.run
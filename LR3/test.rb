require 'glimmer-dsl-libui'
require_relative 'Tab_students'

class MainWindow
  include Glimmer
  def create
    window('Универ', 600, 200) {
      tab {
        tab_item('Студенты') {
          tab_students
        }
        tab_item('Вкладка 2') { }
        tab_item('Вкладка 3') { }
      }
    }
  end
end

main_window = MainWindow.new.create
main_window.show
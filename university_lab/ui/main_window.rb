# frozen_string_literal: true

require 'glimmer-dsl-libui'
require_relative 'tab_students'

class MainWindow
  include Glimmer

  def initialize
    @view_tab_students = TabStudents.new
  end

  def create
    window('University', 900, 200) {
      tab {
        tab_item('Students') {
          @view_tab_students.create
        }
        tab_item('Tab 2') { }
        tab_item('Tab 3') { }
      }
    }
  end
end


class TabStudents
    include Glimmer::LibUI::CustomControl

    body {
      horizontal_box {
        # Секция 1
        vertical_box {
          stretchy false

          form {
            stretchy false

            @filter_last_name_initials = entry {
              label 'ФИО'
            }

            @filters = {}
            fields = [[:git, 'Github'], [:email, 'Почта'], [:phone, 'Телефон'], [:telegram, 'Телеграм']]

            fields.each do |field|
              @filters[field[0]] = {}

              @filters[field[0]][:combobox] = combobox {
                label "#{field[1]} имеется?"
                items ['Не важно', 'Есть', 'Нет']
                selected 0

                on_selected do
                  if @filters[field[0]][:combobox].selected == 1
                    @filters[field[0]][:entry].read_only = false
                  else
                    @filters[field[0]][:entry].text = ''
                    @filters[field[0]][:entry].read_only = true
                  end
                end
              }

              @filters[field[0]][:entry] = entry {
                label field[1]
                read_only true
              }
            end
          }
        }

        # Секция 2
        vertical_box {
          @table = table {

            text_column('ФИО')
            text_column('Github')
            text_column('Контакт')

            editable false

            cell_rows [['Нагалевский А.М.', 'jakepps', '+79995557722'], ['Хахук Р.Н.', 'delta_null', '+79183939494'], ['Гиренко Д.Е.', nil, 'gir@mail.ru'], ['Прозоров М.С.', 'StarProxima', nil]]
          }

          @pages = horizontal_box {
            stretchy false

            button('1')
            button('2')
            button('3')
            label('...') { stretchy false }
            button('20')
          }
        }

        # Секция 3
        vertical_box {
          stretchy true

          button('Добавить') { stretchy false }
          button('Изменить') { stretchy false }
          button('Удалить') { stretchy false }
          button('Обновить') { stretchy false }
        }
      }
    }
  end

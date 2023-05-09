require 'sinatra'
require 'Web_rubbish_code'

set :port, 8000

students_model = RubbishCode::StudentsList.new(
    RubbishCode::StudentsListDBAdapter.new(
        RubbishCode::StudentsListDB
    )
)

main_controller = RubbishCode::ViewController.new(students_model)
main_controller.on_update_data = lambda { }
main_controller.on_add_student_clicked = lambda { }
main_controller.on_edit_student_clicked = lambda { |id| }

main_controller.selected_page = 0

editing_id = nil

get "/" do
    send_file 'web/main.html'
end

post "/students" do
    main_controller.update_table()
    result = main_controller.data_list.list.map { |student|
        student.as_json
    }

    result.to_json
end

post "/next_page" do
    main_controller.next_page()
    main_controller.update_table()
end

post "/last_page" do
    main_controller.last_page()
    main_controller.update_table()
end

get "/get_page" do
    (main_controller.selected_page + 1).to_s
end

get "/get_pages_count" do
    main_controller.pages_count.to_s
end

post "/set_editing_id:id" do
    puts params[:id]
    editing_id = params[:id]
end

get "/get_editing_id" do
    editing_id.to_s
end

post "/delete:id" do
    main_controller.remove_student(params[:id])
end

post "/editing:id" do
    student = main_controller.get_student(params[:id])
    [student.as_json].to_json
end

get "/add" do
    if editing_id == 'null' 
        main_controller.open_student_creation_window()
    else 
        main_controller.open_student_editing_window(editing_id)
    end
    send_file 'web/add.html'
end

get "/edit:student" do
    student = RubbishCode::Student.from_json(JSON.parse(params[:student]))
    main_controller.replace_student(student.id, student)
end

get "/insert:student" do
    student = RubbishCode::Student.from_json(JSON.parse(params[:student]))
    main_controller.add_student(student)
end
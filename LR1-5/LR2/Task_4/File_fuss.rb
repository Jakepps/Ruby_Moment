class Filefuss
  attr_writer :data_transformer

  def initialize(data_transformer)
    self.students = []
    self.seq_id = 1
    self.data_transformer = data_transformer
  end

  def load_from_file(file_path)
    hash_list = data_transformer.str_to_hash_list(File.read(file_path))
    self.students = hash_list.map { |h| Student.from_hash(h) }
    update_seq_id
  end

  def save_to_file(file_path)
    hash_list = students.map(&:to_hash)
    File.write(file_path, data_transformer.hash_list_to_str(hash_list))
  end

  def student_by_id(student_id)
    students.detect { |s| s.id == student_id }
  end

  def paginated_short_students(page, count, existing_data_list: nil)
    offset = (page - 1) * count
    slice = students[offset, count].map { |s| StudentShort.from_student(s) }

    return DataListStudentShort.new(slice) if existing_data_list.nil?

    existing_data_list.append(slice)
  end

  def sorted
    students.sort_by(&:last_name_and_initials)
  end

  def add_student(student)
    student.id = seq_id
    students << student
    self.seq_id += 1
  end

  def replace_student(student_id, student)
    idx = student.find_index { |s| s.id == student_id }
    students[idx] = student
  end

  def remove_student(student_id)
    students.reject! { |s| s.id == student_id }
  end

  def student_count
    students.count
  end

  private

  attr_reader :data_transformer
  attr_accessor :students, :seq_id
end

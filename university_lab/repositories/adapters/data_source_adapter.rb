class DataSourceAdapter

  def student_by_id(student_id)
    raise NotImplementedError('Should be implemented in child')
  end

  def paginated_short_students(page, count, existing_data_list = nil)
    raise NotImplementedError('Should be implemented in child')
  end

  def add_student(student)
    raise NotImplementedError('Should be implemented in child')
  end

  def replace_student(student_id, student)
    raise NotImplementedError('Should be implemented in child')
  end

  def remove_student(student_id)
    raise NotImplementedError('Should be implemented in child')
  end

  def student_count
    raise NotImplementedError('Should be implemented in child')
  end
end
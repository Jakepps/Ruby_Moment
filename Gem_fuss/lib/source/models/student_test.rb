require 'test/unit'
require_relative 'student'

class TestStudent < Test::Unit::TestCase
  def setup
    @student = Student.new('Иванов', 'Иван', 'Иванович')
  end

  def test_full_name
    assert_equal('Иванов Иван Иванович', @student.to_s.split(', ')[0])
  end

  def test_contacts
    @student = Student.new('Иванов', 'Иван', 'Иванович')
    @student.set_contacts(phone: '+79991234567',  email: 'ivanov@example.com')
    assert_equal('+79991234567', @student.phone)
    assert_equal('ivanov@example.com', @student.email)
  end

  def test_valid_name
    assert(Student.valid_name?('Иванов'))
    assert(!Student.valid_name?('Сидоров-Петров'))
    assert(!Student.valid_name?('X'))
    assert(Student.valid_name?('Abcdefghijklmnopqrstuvwxyz'))
    assert(!Student.valid_name?(''))
    assert(!Student.valid_name?('Иванов 123'))
    assert(!Student.valid_name?('Иванов.'))
    assert(!Student.valid_name?('-Иванов'))
  end

  def test_from_hash
    hash = {
      first_name: 'Иван',
      last_name: 'Иванов',
      father_name: 'Иванович',
      phone: '+79991234567',
      telegram: 'ivanov',
      email: 'ivanov@example.com',
      git: 'ivanov'
    }
    student = Student.from_hash(hash)
    assert_equal(hash[:first_name], student.first_name)
    assert_equal(hash[:last_name], student.last_name)
    assert_equal(hash[:father_name], student.father_name)
    assert_equal(hash[:phone], student.phone)
    assert_equal(hash[:telegram], student.telegram)
    assert_equal(hash[:email], student.email)
    assert_equal(hash[:git], student.git)
  end

  def test_from_json_str
    hash = {
      first_name: 'Иван',
      last_name: 'Иванов',
      father_name: 'Иванович',
      phone: '+79991234567',
      telegram: 'ivanov',
      email: 'ivanov@example.com',
      git: 'ivanov'
    }
    json_str = hash.to_json
    student = Student.from_json_str(json_str)
    assert_equal(hash[:first_name], student.first_name)
    assert_equal(hash[:last_name], student.last_name)
    assert_equal(hash[:father_name], student.father_name)
    assert_equal(hash[:phone], student.phone)
    assert_equal(hash[:telegram], student.telegram)
    assert_equal(hash[:email], student.email)
    assert_equal(hash[:git], student.git)
  end
end

class Student
  attr_accessor :id, :name, :age, :gender

  def initialize(args)
    @id = args[:id]
    @name = args[:name]
    @age = args[:age]
    @gender = args[:gender]
  end

  def self.create_table(db)
    db.execute <<-SQL
      CREATE TABLE IF NOT EXISTS student (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        age INTEGER NOT NULL,
        gender TEXT NOT NULL
      );
    SQL
  end

  def self.seed(db)
    db.execute <<-SQL
      INSERT INTO student (name, age, gender) VALUES
        ('John', 20, 'Male'),
        ('Jane', 21, 'Female'),
        ('Bob', 19, 'Male');
    SQL
  end
end
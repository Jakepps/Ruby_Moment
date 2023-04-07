require 'sqlite3'

db = SQLite3::Database.new 'students.db'

db.execute <<-SQL
  CREATE TABLE student (
    id INTEGER PRIMARY KEY,
    name TEXT,
    age INTEGER,
    gender TEXT
  );
SQL

db.execute <<-SQL
  INSERT INTO student (name, age, gender) VALUES
    ('John', 20, 'Male'),
    ('Jane', 21, 'Female'),
    ('Bob', 19, 'Male');
SQL
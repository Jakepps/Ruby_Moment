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
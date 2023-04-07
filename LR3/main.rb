require 'sqlite3'

db = SQLite3::Database.new 'students.db'

db.execute("SELECT * FROM student") do |row|
  puts row.join("\t")
end

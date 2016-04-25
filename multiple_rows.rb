require 'pg'
require './db_utils'
  
begin
    con = DB_Utils.con
    rs = con.exec "SELECT * FROM Cars LIMIT 5"
    rs.each do |row|
      puts "%s %s %s" % [ row['id'], row['name'], row['price'] ]
    end
rescue PG::Error => e
    puts e.message 
ensure
    rs.clear if rs
    con.close if con
end

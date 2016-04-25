require 'pg'
begin
    con = PG.connect :dbname => 'ruby', :user => 'ruby', :password => 'ruby'

    rs = con.exec "SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'"
        
    rs.each do |row|
        puts row['table_name']
    end
rescue PG::Error => e
    puts e.message 
ensure
    rs.clear if rs
    con.close if con
end

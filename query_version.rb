require 'pg'

begin

    con = PG.connect :dbname => 'ruby', :user => 'ruby', :password => 'ruby'

    rs = con.exec 'SELECT VERSION()'
    puts rs.getvalue 0, 0
    
rescue PG::Error => e

    puts e.message 
    
ensure

    con.close if con
    
end
require 'pg'

rowId = 4

begin
  
    con = PG.connect :dbname => 'ruby', :user => 'ruby', :password => 'ruby'
    
    con.prepare 'stm1', "SELECT * FROM Cars WHERE Id=$1"
    rs = con.exec_prepared 'stm1', [rowId]
        
    puts rs.values 
rescue PG::Error => e
    puts e.message 
ensure
    rs.clear if rs
    con.close if con
end
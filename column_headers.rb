require 'pg'

begin

    con = PG.connect :dbname => 'ruby', :user => 'ruby', :password => 'ruby'
    
    rs = con.exec 'SELECT * FROM Cars WHERE Id=0'
    puts 'There are %d columns ' % rs.nfields
    puts 'The column names are:'
    puts rs.fields
rescue PG::Error => e
    puts e.message 
ensure
    rs.clear if rs
    con.close if con
end

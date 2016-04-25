require 'pg'

begin

    con = PG.connect :dbname => 'ruby', :user => 'ruby' , 
        :password => 'ruby'
        
    puts con.server_version

rescue PG::Error => e

    puts e.message 
    
ensure

    con.close if con
    
end
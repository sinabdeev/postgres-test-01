require 'pg'
begin
    con = PG.connect :dbname => 'ruby', :user => 'ruby', :password => 'ruby'
    con.transaction do |con1|
        con1.exec "UPDATE Cars SET Price=23700 WHERE Id=8"
        con1.exec "INSERT INTO Car VALUES(9,'Mazda',27770)"
    end
rescue PG::Error => e
    puts e.message 
ensure
    con.close if con
end

# In the example, we update the price of a car and insert a new car. 
# The two operations are included in a single transaction. 
# This means that either both operations are executed or none.

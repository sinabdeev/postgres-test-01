require 'pg'

class DB_Utils
  
  def self.con
    @con = PG.connect :dbname => 'ruby', :user => 'ruby', :password => 'ruby'     
  end
  
end

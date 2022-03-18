require 'pg'

class DatabaseConnection 
  def self.connection
    fail 'There is no connection' unless @connection
    @connection
  end

  def self.setup(database_name)
    @connection = PG.connect(dbname: database_name)
  end

  def self.query(query, params=[])
    @connection.exec_params(query, params)
  end
end
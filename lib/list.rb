require 'pg'

class List
  def self.view_list
    p ENV['ENVIRONMENT']
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark['url']}
  end

  def self.create(url)
    p ENV['ENVIRONMENT']

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    
    result = connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
    result.map { |bookmark| bookmark['url']}
  end
end
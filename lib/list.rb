require 'pg'

class List
  def self.view_list
    connect_database
    result = @connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| Bookmark.new(bookmark['title'], bookmark['url']) } 
  end

  def self.create(bookmark)
    connect_database
    @connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{bookmark.url}', '#{bookmark.title}')")
  end

  private

  def self.connect_database
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      @connection = PG.connect(dbname: 'bookmark_manager')
    end
  end
  
end
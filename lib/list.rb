require 'pg'

class List
  def self.view_list
    connect_database
    result = @connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| Bookmark.new(bookmark['title'], bookmark['url'], bookmark['id']) }
  end

  def self.create(bookmark)
    connect_database
    @connection.exec_params("INSERT INTO bookmarks (url, title) VALUES($1, $2);", [bookmark.url, bookmark.title])
  end

  def self.delete(id)
    connect_database
    @connection.exec_params("DELETE FROM bookmarks WHERE id=$1;", [id])
  end

  def self.find(id)
    connect_database
    result = @connection.exec_params("SELECT * FROM bookmarks WHERE id=$1;", [id])
    raise 'ID does not exist in database' if result.num_tuples.zero?
    Bookmark.new(result[0]['title'], result[0]['url'], result[0]['id'])
  end

  def self.update(bookmark)
    connect_database
    @connection.exec_params("UPDATE bookmarks SET url=$1, title=$2 WHERE id=$3;", [bookmark.url, bookmark.title, bookmark.id])
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
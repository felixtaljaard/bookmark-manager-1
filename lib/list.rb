require 'pg'
require 'uri'

class List
  def self.view_list
    result = DatabaseConnection.query("SELECT * FROM bookmarks;")
    result.map { |bookmark| Bookmark.new(bookmark['title'], bookmark['url'], bookmark['id']) }
  end

  def self.create(bookmark)
    return false unless bookmark.url =~ /\A#{URI::regexp(['http', 'https'])}\z/
    DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES($1, $2);", [bookmark.url, bookmark.title])
  end

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id=$1;", [id])
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id=$1;", [id])
    raise 'ID does not exist in database' if result.num_tuples.zero?
    Bookmark.new(result[0]['title'], result[0]['url'], result[0]['id'])
  end

  def self.update(bookmark)
   DatabaseConnection.query("UPDATE bookmarks SET url=$1, title=$2 WHERE id=$3;", [bookmark.url, bookmark.title, bookmark.id])
  end

  
end
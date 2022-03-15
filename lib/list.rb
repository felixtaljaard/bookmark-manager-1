require 'pg'

class List
  def self.view_list
    connection = PG.connect(dbname: 'bookmark_manager')
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark['url']}
  end
end
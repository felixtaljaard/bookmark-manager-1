class Bookmark

  attr_reader :title, :url, :id

  def initialize(title, url, id=nil)
    @title = title
    @url = url
    @id = id
  end


end
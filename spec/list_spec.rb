require 'list'

describe List do
  describe '.view_list' do
    it 'returns all bookmarks' do
      bookmarks = List.view_list

    expect(bookmarks).to include "http://www.makersacademy.com"
    expect(bookmarks).to include "http://www.destroyallsoftware.com"
    expect(bookmarks).to include "http://www.google.com"
    end
  end
end
require 'list'
require 'pg'

describe List do
  let(:bookmark1) { double(:bookmark, title: 'Makers Academy', url: 'http://www.makersacademy.com')}
  let(:bookmark2) { double(:bookmark, title: 'Destroy all Software', url: 'http://www.destroyallsoftware.com')}
  let(:bookmark3) { double(title: 'Google', url: 'http://www.google.com') }
  before do
    allow(Bookmark).to receive(:new).and_return(bookmark1, bookmark2, bookmark3)
  end

  describe '.view_list' do
    it 'returns all bookmarks' do
      List.create(bookmark1)
      List.create(bookmark2)
      List.create(bookmark3)
      
      bookmarks = List.view_list
      expect(bookmarks).to include bookmark1
      expect(bookmarks).to include bookmark2
      expect(bookmarks).to include bookmark3
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      List.create(bookmark1)
      expect(List.view_list).to include bookmark1
    end
  end

  
end
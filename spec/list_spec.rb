require 'list'
require 'pg'

describe List do
  let(:bookmark1) { double(:bookmark, title: 'Makers Academy', url: 'http://www.makersacademy.com')}
  let(:bookmark2) { double(:bookmark, title: 'Destroy all Software', url: 'http://www.destroyallsoftware.com', id: "2")}
  let(:bookmark2_updated) { double(:bookmark, title: 'Destroy', url: 'http://www.destroy.com', id: "2")}
  let(:bookmark3) { double(title: 'Google', url: 'http://www.google.com') }
  let(:invalid_bookmark) { double(title:'Twitter', url: 'twitter') }

  context "with mocks"
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
    it 'does not create a bookmark if url is invalid' do
      List.create(invalid_bookmark)
      expect(List.view_list).to be_empty
    end
  end

  describe ".delete" do
    it "deletes the bookmark from the database" do
      List.create(bookmark1)
      List.create(bookmark2)
      List.delete(bookmark2.id)
      expect(List.view_list).to_not include bookmark2
    end
  end

  describe ".find" do
    it "finds the bookmark from the id" do
      allow(Bookmark).to receive(:new).and_return(bookmark2)
      List.create(bookmark1)
      List.create(bookmark2)
      expect(List.find(bookmark2.id)).to be bookmark2
    end
    it 'raises an error when id does not exist' do
      List.create(bookmark1)
      expect { List.find('3321232') }.to raise_error('ID does not exist in database')
    end
  end

  describe ".update" do
    it "it updates the bookmark title" do
      allow(Bookmark).to receive(:new).and_call_original
      List.create(bookmark1)
      List.create(bookmark2)
      List.update(bookmark2_updated)
      expect(List.find(bookmark2.id).title).to eq('Destroy')
    end
    it "it updates the bookmark url" do
      allow(Bookmark).to receive(:new).and_call_original
      List.create(bookmark1)
      List.create(bookmark2)
      List.update(bookmark2_updated)
      expect(List.find(bookmark2.id).url).to eq('http://www.destroy.com')
    end
  end

  
end
require 'bookmark'

describe Bookmark do
  subject(:bookmark) { Bookmark.new('Google', 'http://www.google.com') }
  let(:bookmark_with_id) { Bookmark.new('Google', 'http://www.google.com', "1") }
  describe "#initialize" do
    it "remembers the title" do
      expect(bookmark.title).to eq 'Google'
    end
    it "remembers the url" do
      expect(bookmark.url).to eq 'http://www.google.com'
    end
    it "id is nil when created" do
      expect(bookmark.id).to be_nil
    end
    it "remembers the id when given" do
      expect(bookmark_with_id.id).to eq '1'
    end
  end
end
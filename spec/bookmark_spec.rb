require 'bookmark'

describe Bookmark do
  subject(:bookmark) { Bookmark.new('Google', 'http://www.google.com') }
  describe "#initialize" do
    it "remembers the title" do
      expect(bookmark.title).to eq 'Google'
    end
    it "remembers the url" do
      expect(bookmark.url).to eq 'http://www.google.com'
    end
  end
end
require "bookmark"

describe Bookmark do
  describe ".all" do
    it "returns all bookmarks" do
      bookmarks = Bookmark.all
      expect(bookmarks).to include("http://www.makersacademy.com - Makers")
      expect(bookmarks).to include("http://www.twitter.com - Makers")
      expect(bookmarks).to include("http://www.facebook.com - Makers")
    end
  end
end

require "bookmark"

describe Bookmark do
  describe "#all" do
    it "returns all bookmarks" do
      bookmarks = Bookmark.all
      expect(bookmarks).to include("http://www.makersacademy.com - Makers")
      expect(bookmarks).to include("http://www.twitter.com - Twitter")
      expect(bookmarks).to include("http://www.facebook.com - Facebook")
    end
  end

  describe "#create" do
    it 'adds bookmark to db' do
      title = "Pop"
      url = "pop.com"
      Bookmark.create(url, title)
      connection = PG.connect(dbname: 'bookmark_manager_test')
      result = connection.exec("SELECT * FROM bookmarks WHERE url = 'pop.com';")
      expect(result[0]['url']).to eq "pop.com"
      expect(result[0]['title']).to eq "Pop"
    end
  end
end

require "bookmark"

describe Bookmark do
  describe "#all" do
    it "returns all bookmarks" do
      bookmarks = Bookmark.all
      expect(bookmarks.first).to be_a_kind_of Bookmark
      expect(bookmarks.first.url).to eq "http://www.makersacademy.com"
      expect(bookmarks.first.title).to eq "Makers"      
      expect(bookmarks[1]).to be_a_kind_of Bookmark
      expect(bookmarks[1].url).to eq "http://www.twitter.com"
      expect(bookmarks[1].title).to eq "Twitter"
      expect(bookmarks.last).to be_a_kind_of Bookmark
      expect(bookmarks.last.url).to eq "http://www.facebook.com"
      expect(bookmarks.last.title).to eq "Facebook"
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

  describe "#delete" do
    it 'removes a bookmark from db' do
      title = "Pop"
      url = "pop.com"
      Bookmark.create(url, title)
      connection = PG.connect(dbname: 'bookmark_manager_test')
      result = connection.exec("SELECT * FROM bookmarks WHERE url = 'pop.com';")
      id = result[0]["id"]
      Bookmark.delete(id)
      new_result = connection.exec("SELECT * FROM bookmarks WHERE url = 'pop.com';")
      expect(new_result.ntuples).to eq 0
    end
  end

end

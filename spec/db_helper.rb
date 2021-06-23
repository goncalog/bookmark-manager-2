require "pg"

def empty_and_populate_db
  connection = PG.connect(dbname: "bookmark_manager_test")
  connection.exec("TRUNCATE TABLE bookmarks")
  Bookmark.create("http://www.makersacademy.com", "Makers")
  Bookmark.create("http://www.twitter.com", "Makers")
  Bookmark.create("http://www.facebook.com", "Makers")
end

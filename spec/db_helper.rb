require 'pg'

def empty_and_populate_db
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("TRUNCATE TABLE bookmarks")
  Bookmark.create('http://www.makersacademy.com')
  Bookmark.create('http://www.twitter.com')
  Bookmark.create('http://www.facebook.com')
end
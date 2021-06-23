require 'pg'

class Bookmark
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'bookmark_manager_test')
    else
      conn = PG.connect(dbname: 'bookmark_manager')
    end

    result = conn.exec("SELECT * FROM bookmarks")
    result.map { |row| row['url'] }
  end

  def self.create(url)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'bookmark_manager_test')
    else
      conn = PG.connect(dbname: 'bookmark_manager')
    end

    conn.exec("INSERT INTO bookmarks (url) VALUES('#{url}');")
  end
end

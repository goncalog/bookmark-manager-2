require "pg"

class Bookmark
  def self.all
    if ENV["ENVIRONMENT"] == "test"
      conn = PG.connect(dbname: "bookmark_manager_test")
    else
      conn = PG.connect(dbname: "bookmark_manager")
    end

    result = conn.exec("SELECT * FROM bookmarks")
    result.map do |bm| 
      { url: bm["url"], title: bm["title"] }
    end
  end

  def self.create(url, title)
    if ENV["ENVIRONMENT"] == "test"
      conn = PG.connect(dbname: "bookmark_manager_test")
    else
      conn = PG.connect(dbname: "bookmark_manager")
    end

    if url.include?('DROP TABLE') || title.include?('DROP TABLE')
      raise 'Trying to delete a table'
    else
      conn.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}');")
    end 
  end
end

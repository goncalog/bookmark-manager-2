require "pg"

class Bookmark
  def self.all
    if ENV["ENVIRONMENT"] == "test"
      conn = PG.connect(dbname: "bookmark_manager_test")
    else
      conn = PG.connect(dbname: "bookmark_manager")
    end

    result = conn.exec("SELECT * FROM bookmarks")
    result.map { |row| "#{row["url"]} - #{row["title"]}" }
  end

  def self.create(url, title)
    if ENV["ENVIRONMENT"] == "test"
      conn = PG.connect(dbname: "bookmark_manager_test")
    else
      conn = PG.connect(dbname: "bookmark_manager")
    end

    conn.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}');")
  end
end

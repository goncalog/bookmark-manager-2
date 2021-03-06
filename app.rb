require "sinatra/base"
require "sinatra/reloader"
require_relative "./lib/bookmark"

class BookmarkManager < Sinatra::Base
  enable :method_override

  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    erb :index
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  post "/add-bookmark" do
    Bookmark.create(params[:url], params[:title])
    redirect "/bookmarks"
  end

  delete "/bookmarks/:id" do
    Bookmark.delete(params[:id])
    redirect "/bookmarks"
  end

  run! if app_file == $0
end

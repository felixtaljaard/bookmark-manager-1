require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/list'
require 'pg'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    p ENV

    @list = List.view_list
    erb :'bookmarks/index'
  end

  get '/bookmarks/add' do
    p ENV

    erb :'bookmarks/add'
  end
  
  post '/bookmarks' do
    p ENV
    p params

    url = params[:url]
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
    redirect '/bookmarks'
  end


  run! if app_file == $0
end
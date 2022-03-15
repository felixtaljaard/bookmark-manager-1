require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/list'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  post '/bookmarks' do
    @list = List.view_list
    erb :'bookmarks/index'
  end

  run! if app_file == $0
end
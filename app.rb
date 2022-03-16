require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/list'
require 'pg'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/bookmarks' do


    @list = List.view_list
    erb :'bookmarks/index'
  end

  get '/bookmarks/add' do

    erb :'bookmarks/add'
  end
  
  post '/bookmarks' do
    List.create(Bookmark.new(params[:title], params[:url]))
    redirect '/bookmarks'
  end


  run! if app_file == $0
end
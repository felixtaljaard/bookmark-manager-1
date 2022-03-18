require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/list'
require 'pg'
require './lib/bookmark'
require './database_connection_setup'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :method_override

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

  delete '/bookmarks/delete_bookmark/:id' do
    List.delete(params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = List.find(params[:id])
    erb :'bookmarks/update'
  end

  put '/bookmarks/update_bookmark/:id' do
    List.update(Bookmark.new(params[:title], params[:url], params[:id]))
    redirect '/bookmarks'
  end


  run! if app_file == $0
end
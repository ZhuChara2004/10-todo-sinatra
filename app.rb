require 'sinatra'
require 'sinatra/activerecord'
set :database, 'sqlite3:todo.db'

class Item < ActiveRecord::Base
end

get '/' do
  @items = Item.order('created_at desc')

  haml :index
end

get '/new' do
  @item = Item.new

  haml :new
end

post '/new' do
  item = Item.new(params[:item])
  if item.save
    redirect '/'
  else
    haml :new
  end
end

get '/delete/:id' do
  @item = Item.find(params[:id])
  haml :delete
end

post '/delete/:id' do
  if params.has_key?('ok')
    item = Item.find(params[:id])
    item.destroy
    redirect '/'
  else
    redirect '/'
  end
end

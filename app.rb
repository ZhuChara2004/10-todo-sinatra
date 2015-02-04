require 'sinatra'
require 'sinatra/activerecord'
set :database, 'sqlite3:todo.db'

class Item < ActiveRecord::Base
end



require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base
end

before do
  @pizza = Product.all
end

get '/' do
  erb :index
end

get '/about' do
  erb :about
end

get '/basket' do
  erb :basket
end

post '/basket' do
   erb :basket
end


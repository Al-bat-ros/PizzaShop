require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
end

before do
  @pizza = Product.all
  @cart = Order.all
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

	#получаем список пораметров и разбираем их
	@orders_input = params[:orders]
	@items = parse_orders_line @orders_input

	#выводим сообщение что корзина пуста
	if @items.length == 0
       return erb :cart_is_empty
	end

    #выводим список продуктов в корзине
	@items.each do|item|
      # id, cnt
      item[0] = @pizza.find(item[0])
	end

	#возвращаем представление по умолчанию
   erb :basket
end

post '/place_order' do
 
 @o = Order.new params[:cart]
   if @o.save 
   	 erb "Спасибо ваш заказ принят!"
   	else
   		@error = "Заказ непринят"
        erb :basket
   end
   erb :order_placed
end

get '/place_order' do
   erb :place_order
end


def parse_orders_line orders_input

s1 = orders_input.split(/,/)

  arr = []

    s1.each do |x|
      s2 = x.split(/=/)

      s3 = s2[0].split(/_/)

      id = s3[1]
      cnt = s2[1]

      arr2 = [id, cnt]

      arr.push arr2

  end

  return arr

end



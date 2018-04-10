class AddProducts < ActiveRecord::Migration[5.1]
  def change

  	Product.create :title => 'Lajt', 
  	               :description => 'This is Lajt pizza', 
  	               :price => 450,
  	               :size => 30, 
  	               :is_spicy => false, 
  	               :is_veg => false, 
  	               :is_best_offer => false,
  	               :path_to_image => '/images/Lajt.jpg'

  	Product.create :title => 'morskaya', 
  	               :description => 'Amazing Vegetarian pizza', 
  	               :price => 400,
  	               :size => 30, 
  	               :is_spicy => false, 
  	               :is_veg => true, 
  	               :is_best_offer => false,
  	               :path_to_image => '/images/morskaya.jpg'

  	Product.create :title => 'Peperoni', 
  	               :description => 'Nice Peperoni pizza', 
  	               :price => 400,
  	               :size => 30, 
  	               :is_spicy => false, 
  	               :is_veg => false, 
  	               :is_best_offer => false,
  	               :path_to_image => '/images/Peperoni.jpg'
  end
end
 
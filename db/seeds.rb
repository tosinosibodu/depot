# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Product.delete_all

Product.create(:title=> 'Red Polo Ralph Lauren Shirt', 
               :description=>
               %{<p>
                 Red Shirt worn by Eddie in Survival Scene
                 </p>},
                 :image_url => '/images/red_polo.jpg', 
                 :price=>40.00)

Product.create(:title=> 'Green Polo Ralph Lauren Shirt', 
               :description=>
               %{<p>
                 Green Shirt worn by Eddie in Survival Scene
                 </p>},
                 :image_url => '/images/green_polo.jpg', 
                 :price=>35.00)

Product.create(:title=> 'Blue Polo Ralph Lauren Shirt', 
               :description=>
               %{<p>
                 Blue Shirt worn by Eddie in Survival Scene
                 </p>},
                 :image_url => '/public/images/blue_polo.jpg', 
                 :price=>50.00)
                 


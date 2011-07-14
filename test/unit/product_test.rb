require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  fixtures :products
  
  test "truth" do
    assert true
  end
  
  test "product attributes must not be blank" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:image_url].any?
    assert product.errors[:price].any?
  end
  
  test "product price must be positive" do
    product = Product.new(:title       => "My Polo shirt",
                          :description => "yyy",
                          :image_url   => "zzz.jpg")
    product.price = -1
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01", 
      product.errors[:price].join('; ')

    product.price = 0
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01", 
      product.errors[:price].join('; ')

    product.price = 1
    assert product.valid?
  end

  def new_product(image_url)
    Product.new(:title       => "My Book Title",
                :description => "yyy",
                :price       => 1,
                :image_url   => image_url)
  end
    
  test "image url is right format" do
      
    good = %w{abc.gif abc.jpg abc.png ABC.GIF ABC.JPG ABC.PNG http://a.b.c/x/y/z/fred.gif}  
    bad = %w{fred.doc hey.gif.more}
    
    good.each do |image|
      assert new_product(image).valid?, "#{image} should be valid"
    end
    
    bad.each do |image|
      assert new_product(image).invalid?, "#{image} should be invalid"
    end
  end

  test "title of product must be unique" do
    product = Product.new(:title => products(:polo).title,
                          :description => "something",
                          :image_url => "abc.jpg",
                          :price => 45.60)
    assert !product.save
    assert_equal "has already been taken", product.errors[:title].join('; ')
  end
end


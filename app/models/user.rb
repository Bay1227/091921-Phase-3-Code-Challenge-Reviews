class User < ActiveRecord::Base
  has_many :reviews
  has_many :products, through: :reviews

  def favorite_product 
    Product.all.sort_by {|product| product.star_rating}.last
  end 

  def remove_reviews(product) 
    review = self.reviews.find_by_product_id(product.id)
    review.destroy if product
  end
    
end
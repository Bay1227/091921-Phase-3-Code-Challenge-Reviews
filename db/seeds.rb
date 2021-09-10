# This will delete any existing rows from the Product and User tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting old data..."
Product.destroy_all
User.destroy_all
Review.destroy_all

puts "Creating users..."
user1 = User.create(name: Faker::Name.name)
user2 = User.create(name: Faker::Name.name)
user3 = User.create(name: Faker::Name.name)

puts "Creating products..."
product1 = Product.create(name: "Stapler", price: 10)
product2 = Product.create(name: "Whiteboard", price: 15)
product3 = Product.create(name: "Dry Erase Markers", price: 5)
product4 = Product.create(name: "Ballpoint Pens", price: 2)
product5 = Product.create(name: "Scotch Tape", price: 3)

puts "Creating reviews..."
# *****************************************************************
# * TODO: create reviews! Remember, a review belongs to a product *
# * and a review belongs to an user.                              *
# *****************************************************************
# Create Reviews Here
review1 = Review.create(star_rating: 1, comment: "Hi", user_id: user1.id, product_id: product1.id)
review2 = Review.create(star_rating: 2, comment: "Hello", user_id: user2.id, product_id: product2.id)
review3 = Review.create(star_rating: 3, comment: "How are you", user_id: user3.id, product_id: product3.id)

puts "Seeding done!"
puts 
puts "Review#user for user1"
puts review1.user.name
puts 
puts "Review#product for user1"
puts review2.product.price
puts 
puts "Product reviews and users"
puts product1.reviews.map(&:comment)
puts 
puts product1.users.map(&:name)
puts 
puts "User reviews and product"
puts user1.reviews.map(&:star_rating)
puts 
puts user1.products.map(&:name)
puts 
puts "Print review for review3"
puts review3.print_review
puts 
puts "Testting leave review method"
# puts stapler_review.print_review

puts "removing review1"
puts user1.reviews
puts user2.remove_reviews(product2)
puts "High start rating"
puts product1.favorite_product.name
puts "favorite_product"
puts user1.favorite_product



puts
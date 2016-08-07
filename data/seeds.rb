require 'faker'

# This file contains code that populates the database with
# fake data for testing purposes


=begin
def db_seed
  # Your code goes here!

  brands = ["Crayola", "Lego", "Nintendo", "Fisher-Price", "Hasbro"]
  product_names = ["crayons", "house", "video game", "kitchen", "toy car"]
  prices = ["2.00", "14.50", "2.10", "99.99", "19.99"]

  100.times do
    # you will write the "create" method as part of your project
    Product.create( brand: brands.sample,
                    name: product_names.sample,
                    price: prices.sample )
  end
end
=end


def db_seed
  # Your code goes here!

  @csv_path = File.dirname(__FILE__) + "/../data/data.csv"
  CSV.open(@csv_path, 'ab') do |csv|

    10.times do |id|
      # you will write the "create" method as part of your project
      csv<<[id, Faker::Commerce.department(2, true),
            Faker::Commerce.product_name,
            Faker::Commerce.price ]
    end
  end
end

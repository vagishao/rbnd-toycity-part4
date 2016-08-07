require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata

  @@csv_path = File.dirname(__FILE__) + "/../data/data.csv"

  def self.create(attributes = nil)
    # If the object's data is already in the database
    # return the object

    # If the object's data is not in the database
    # create the object
    # save the data in the database
    # return the object

    product = Product.new(attributes)
    CSV.open(@@csv_path, "ab") do |csv|
      csv << [product.id, product.brand, product.name, product.price]
    end

    product


  end

  def self.all


    products = []
    CSV.read(@@csv_path, headers: true).each do |product|
      products << self.new(id: product['id'], brand: product['brand'],  price: product['price'],name: product['product'])
    end
    products

  end


  def self.first(num=1)
    # puts @@products
    (num==1)?all.first : all.first(num)
  end

  def self.last(num=1)
    num==1?all.last : all.last(num)
  end

  def self.find(id)
    product = all.find{ |product| product.id == id }
    if product.nil?
      raise ProductNotFoundError, "Can't find product id#{id}"
    else
      product
    end
  end



  def self.destroy(id)

    #populate products

     all

     products = []
     database = CSV.table(@@csv_path)
     database.each do |data|
       products << new(id: data[:id], brand: data[:brand], name: data[:product], price: data[:price])
     end

     if find(id)
       del_product = find(id)
       database.delete_if do |row|
         row[:id] == id
       end
     end

     File.open(@@csv_path, "w") do |f|
       f.write(database.to_csv)
     end

     del_product

  end

  def self.where(options)
    if options[:brand]
      all.select{|product| product.brand == options[:brand]}
    else
      all.select{|product| product.name == options[:name]}
    end

  end

  def update(options)
    product = self.class.destroy(self.id)
    old_data = {id: id, brand: product.brand, name: product.name, price: product.price}
    updated_data = old_data.merge(options)
    self.class.create(updated_data)

  end





end

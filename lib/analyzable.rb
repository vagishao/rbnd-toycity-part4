module Analyzable


  def self.count_by_brand(products)
    count_by_brand = {}
    brands = []
    products.each { |product| brands << product.brand }

    brands.uniq!

    brands.each do |brand|
      products.each do |product|
        if product.brand == brand
          count_by_brand[brand] = count_by_brand[brand].nil? ? 1 : count_by_brand[brand]+=1
        end
      end
    end
    count_by_brand

  end
  def self.count_by_name(products)
    count_by_name = {}
    all_name = []
    products.each { |product| all_name << product.name }

    all_name.uniq!

    all_name.each do |name|
      products.each do |product|
        if product.name == name
          count_by_name[name] = count_by_name[name].nil? ? 1 : count_by_name[name]+=1
        end
      end
    end
    count_by_name
  end

  def self.average_price(products)
    average_price = 0.00
    products.each { |product| average_price += (product.price.to_f)/products.size }
    average_price.round(2)

  end

  def self.print_report(products)
    avg_price = average_price(products)
    report =  "Average price: #{avg_price}"


    puts 'Inventory by Brand:'
    hash = count_by_brand(products)
    hash.each do |brand,count|
      report+= " #{brand}: #{count}".rjust(6)
    end


    puts 'Inventory by Name:'
    hash = count_by_name(products)
    hash.each do |brand,count|
      report +=" #{brand}: #{count}".rjust(6)
    end

    report
  end

end

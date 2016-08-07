class Module
  def create_finder_methods(*attributes)
    # Your code goes here!
    # Hint: Remember attr_reader and class_eval
    attributes.each do |find|
      self.send(:define_singleton_method, "find_by_#{find}") do |params|
        all.each do |product|
          #return product if product.find == params
          return product if product.send(find) == params
        end
      end
    end
  end
end

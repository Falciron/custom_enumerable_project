module Enumerable
  # Your code goes here
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    index = 0
    self.my_each do |element|
      yield element,index
      index += 1
    end
    return self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    # Enumerable.select always returns an array, regardless of the class of self.
    selected_array = []
    self.my_each do |element|
      selected_array << element if yield element
    end
    return selected_array
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum(:my_each) unless block_given?

    self.length.times do |index|
      yield self[index]
    end
    return self
  end
end

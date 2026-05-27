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
    self.my_each { |element| selected_array << element if yield element }
    return selected_array
  end

  def my_all?
    return to_enum(:my_all?) unless block_given?

    all_pass = true
    self.my_each { |element| all_pass = false unless yield element }
    return all_pass
  end

  def my_any?
    return to_enum(:my_all?) unless block_given?

    self.my_each { |element| return true if yield element }

    return false
  end

  def my_none?
    return to_enum(:my_none?) unless block_given?

    self.my_each { |element| return false if yield element }

    return true
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

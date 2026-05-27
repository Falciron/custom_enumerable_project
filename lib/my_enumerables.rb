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

    # Enumerable.select always returns an Array by default. This implementation must act a little differently,
    # then, in order to accommodate Hash's overrided logic.
    selected_elements = self.class.new
    if self.is_a? Array
      self.my_each { |element| selected_elements << element if yield element}
    else # Hash
      self.my_each { |element| selected_elements[element[0]] = element[1] if yield element}
    end
    return selected_elements
  end

  def my_all?
    all_pass = true
    self.my_each { |element| all_pass = false unless yield element }
    return all_pass
  end

  def my_any?
    self.my_each { |element| return true if yield element }

    return false
  end

  def my_none?
    self.my_each { |element| return false if yield element }

    return true
  end

  def my_count
    return self.size unless block_given?

    count = 0
    self.my_each { |element| count += 1 if yield element }
    return count
  end

  def my_map
    return to_enum(:my_map) unless block_given?

    mapped_array = []
    self.my_each { |element| mapped_array << (yield element) }
    return mapped_array
  end

  def my_inject (initial_value)
    final_value = initial_value
    self.my_each { |element| final_value = yield final_value, element}
    return final_value
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

    self.size.times do |index|
      yield self[index]
    end
    return self
  end
end

class Hash
  def my_each
    return to_enum(:my_each) unless block_given?

    self.keys.size.times do |index|
      current_key = self.keys[index]
      yield [current_key, self[current_key]]
    end
    return self
  end
end
require_relative 'lib/my_enumerables'

include Enumerable

animal_houses = {:fish => 'Tank', :bird => 'Cage'}

animal_houses.each {|element| puts "#{element}"}
animal_houses.my_each {|element| puts "#{element}"}

animal_houses.each_with_index {|element,index| puts "#{element}, #{index}"}
animal_houses.my_each_with_index {|element,index| puts "#{element}, #{index}"}

p animal_houses.select do |k,v|
  k == :fish
end
p animal_houses.my_select do |k,v|
  k == :fish
end

p animal_houses.all? {|element| element[1].include?('a')}
p animal_houses.my_all? {|element| element[1].include?('a')}

p animal_houses.any? {|element| element[1].include?('T')}
p animal_houses.my_any? {|element| element[1].include?('T')}

p animal_houses.none? {|element| element[1].include?('B')}
p animal_houses.my_none? {|element| element[1].include?('B')}

p animal_houses.count {|element| element[1].include?('k')}
p animal_houses.my_count {|element| element[1].include?('k')}

p animal_houses.map {|element| element[1].reverse}
p animal_houses.my_map {|element| element[1].reverse}

p animal_houses.inject([]) {|final_value, element| element}
p animal_houses.my_inject([]) {|final_value, element| element}
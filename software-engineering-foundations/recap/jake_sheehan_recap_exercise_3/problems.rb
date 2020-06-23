# Jake Sheehan
# App Academy
# Recap 3

################################# General Problems #############################
################################################################################

# Write a method no_dupes?(arr) that accepts an array as an arg and returns an 
# new array containing the elements that were not repeated in the array.

def no_dupes?(arr)
    count_hash = Hash.new(0)
    non_dupes = []

    arr.each { |ele| count_hash[ele] += 1 }

    count_hash.each do |key, val|
        non_dupes << key if val == 1
    end

    non_dupes
end

# Examples
puts "no_dupes?"
puts "---------"
p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []
puts 
puts

################################################################################

# Write a method no_consecutive_repeats?(arr) that accepts an array as an arg. 
# The method should return true if an element never appears consecutively in the array; 
# it should return false otherwise.

def no_consecutive_repeats?(arr)
    (0...arr.length - 1).each do |idx|
        next_idx = idx + 1
        return false if arr[idx] == arr[next_idx]
    end

    true
end

# Examples
puts "no_consecutive_repeats?"
puts "------------------------"
p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p no_consecutive_repeats?(['x'])                              # => true
puts
puts

################################################################################

# Write a method char_indices(str) that takes in a string as an arg. 
# The method should return a hash containing characters as keys. 
# The value associated with each key should be an array containing the indices 
# where that character is found.

def char_indices(str)
    indices = Hash.new { |h, k| h[k] = Array.new}

    str.each_char.with_index do |char, idx|
        indices[char] << idx
    end

    indices
end

# Examples
puts "char_indices"
puts "--------------"
p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}
puts
puts

################################################################################

# Write a method longest_streak(str) that accepts a string as an arg. 
# The method should return the longest streak of consecutive characters in the string. 
# If there are any ties, return the streak that occurs later in the string.

def longest_streak(str)
    longest = ""
    test_str = ""

    (0...str.length).each do |i|
        char = str[i]
        next_char = str[i + 1]

        if char == next_char
            test_str += char
            longest = test_str if test_str.length >= longest.length
        else
            test_str += char
            longest = test_str if test_str.length >= longest.length
            test_str = ""
        end
    end

    longest
end

# Examples
puts "longest_streak"
puts "--------------"
p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'
puts
puts

################################################################################

# Write a method bi_prime?(num) that accepts a number as an arg and returns 
# a boolean indicating whether or not the number is a bi-prime. A bi-prime is a 
# positive integer that can be obtained by multiplying two prime numbers.

def bi_prime?(num)
    
end

# Examples
puts "bi_prime"
puts "--------"
p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false
puts
puts

################################################################################

# Write a method vigenere_cipher(message, keys) that accepts a string and a 
# key-sequence as args, returning the encrypted message. Assume that the message 
# consists of only lowercase alphabetic characters.

def vigenere_cipher(message, keys)
end

# Examples
puts "vigenere_cipher"
puts "---------------"
p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"
puts
puts

################################################################################

# Write a method vowel_rotate(str) that accepts a string as an arg and returns 
# the string where every vowel is replaced with the vowel the appears before it 
# sequentially in the original string. The first vowel of the string should be 
# replaced with the last vowel.

def vowel_rotate(str)
end

# Examples
puts "vowel_rotate"
puts "------------"
p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"
puts
puts

################################# Proc Problems ################################
################################################################################

# Extend the string class by defining a String#select method that accepts a block. 
# The method should return a new string containing characters of the original 
# string that return true when passed into the block. If no block is passed, 
# then return the empty string. Do not use the built-in Array#select in your solution.

class String

    def select(&prc)
        prc ||= nil
    end

end

# Examples
puts "String#select"
puts "-------------"
p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""
puts
puts

################################################################################

# Extend the string class by defining a String#map! method that accepts a block. 
# The method should modify the existing string by replacing every character with 
# the result of calling the block, passing in the original character and it's index. 
# Do not use the built-in Array#map or Array#map! in your solution.

class String

    def map!(&prc)
        prc ||= nil
    end

end

# Examples
puts "String#map!"
puts "-----------"
word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p word_1        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
    if i.even?
        ch.upcase
    else
        ch.downcase
    end
end
p word_2        # => "DiJkStRa"
puts
puts

################################# Recursion Problems ###########################
################################################################################

# Write a method multiply(a, b) that takes in two numbers and returns their product.
# You must solve this recursively (no loops!)
# You must not use the multiplication (*) operator

def multiply(a, b)
end

# Examples
puts "multiply"
puts "--------"
p multiply(3, 5)        # => 15
p multiply(5, 3)        # => 15
p multiply(2, 4)        # => 8
p multiply(0, 10)       # => 0
p multiply(-3, -6)      # => 18
p multiply(3, -6)       # => -18
p multiply(-3, 6)       # => -18
puts
puts

################################################################################

# Write a method lucasSequence that accepts a number representing a length as an arg. 
# The method should return an array containing the Lucas Sequence up to the given length. 
# Solve this recursively.

def lucas_sequence(len)
end

# Examples
puts "lucas_sequence"
puts "--------------"
p lucas_sequence(0)   # => []
p lucas_sequence(1)   # => [2]    
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]
puts
puts

################################################################################

# Write a method prime_factorization(num) that accepts a number and returns an array 
# representing the prime factorization of the given number. This means that the array 
# should contain only prime numbers that multiply together to the given num. 
# The array returned should contain numbers in ascending order. Do this recursively.

def prime_factorization(num)
end

# Examples
puts "prime_factorization"
puts "-------------------"
p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]
# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

##### Helper Functions #####

# takes integer and returns bool, checking primality
def prime?(num)
    # integers less than 2 cannot be prime
    return false if num < 2
    # even integers greater than 2 cannot be prime
    return false if (num > 2 && num.even?)

    # Highest number to check is sqrt of num rounded up
    max = (Math.sqrt(num)).ceil

    # iterate 2 to max returning false if i is factor
    (2...max).each do |i|
        return false if num % i == 0
    end

    true
end

##### PROBLEM 1 #####

# takes in intger and returns largest prime factor (integer)
def largest_prime_factor(num)
    factors = []
    prime_factors = []

    # iterate integers up to num (inclusive) and check if factor
    (1..num).each do |factor|
        factors << factor if num % factor == 0
    end

    # iterate factors to check if prime
    factors.each do |factor|
        prime_factors << factor if prime?(factor)
    end

    prime_factors[-1]
end

##### PROBLEM 2 #####

# takes in string and returns bool checking if dup chars exists in string
def unique_chars?(str)
    char_count = Hash.new(0)

    # char_count hash counts number of each char in string
    str.each_char { |char| char_count[char] += 1 }

    # returns false ifcount of a char is greater than 1
    char_count.each_value { |v| return false if v > 1 }

    true
end

##### PROBLEM 3 #####

# takes in array and returns hash containing dupe elements with index
def dupe_indices(arr)
    count = Hash.new(0)
    dupes = Hash.new
    
    # get count of each element
    arr.each { |el| count[el] += 1 }

    # add dupes to hash called dupes with [] default value
    count.each do |k, v|
        if v > 1
            dupes[k] = []
        end
    end

    # find and add indices of dupes
    arr.each_with_index do |el, idx|
        dupes[el] << idx if dupes.key?(el)
    end

    dupes
end

##### PROBLEM 4 #####

def ana_array(arr_1, arr_2)
    arr_1.each { |el| return false if !(arr_2.include?(el)) }
    arr_2.each { |el| return false if !(arr_1.include?(el)) }
    true
end





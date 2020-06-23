# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.


def coprime?(num1, num2)
    # Get factors and remove 1 and num1
    factors1 = factor(num1)
    factors1.shift
    factors1.pop

    # Get factors and remove 1 and num2
    factors2 = factor(num2)
    factors2.shift
    factors2.pop

    # return false if nums share a common factor
    factors1.each { |factor| return false if factors2.include?(factor) }

    return true
end

# Gets factors
def factor(num)
    factors = []

    # Check each number from 1 to half of num for factors
    max = (num / 2.0).ceil
    (1..max).each do |i|
        factors << i if num % i == 0
    end

    # Add num itself to factors and return array
    factors << num
    return factors
end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false

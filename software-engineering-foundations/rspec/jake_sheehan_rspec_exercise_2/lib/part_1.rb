def partition(arr, num)
    # Create new 2D array
    partition_array = Array.new(2) {Array.new(0)}
    
    # Add nums to partition depending on their values compared to num
    arr.each do |i|
        partition_array[0] << i if i < num
        partition_array[1] << i if i >= num
    end

    partition_array
end

def merge(hash_1, hash_2)
    new_hash = {}

    # Iterate hash 1 adding key-values into new hash
    hash_1.each do |key, value|
        new_hash[key] = value
    end

    # Iterate hash 2 adding key-values and overwriting any duplicates
    hash_2.each do |key, value|
        new_hash[key] = value
    end

    new_hash
end

def censor(sentence, curses_arr)
    vowels = "aeiou"
    words = sentence.split

    return sentence unless words.any? { |word| curses_arr.include?(word.downcase)}

    words.each do |word|
        if curses_arr.include?(word.downcase)
            word.each_char.with_index do |char, idx|
                if vowels.include?(char.downcase)
                    word[idx] = "*"
                end
            end
        end

    end

    words.join(" ")
end

def power_of_two?(num)
    return true if num == 1
    return false if num.odd?

    i = 2
    until i > num
        return true if i == num
        i *= 2
    end

    false
end






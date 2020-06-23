# Return the average of two numbers
def average(num_1, num_2)
    (num_1 + num_2) / 2.0
end

# Returns the average of an array of numbers
def average_array(arr)
    arr.sum / arr.length.to_f
end

# Reapeats a string x number of times
def repeat(str, num)
    str * num
end

# Returns a string with all caps and exclamation point
def yell(str)
    str.upcase + "!"
end

# Returns sentence with words alternatiing upper and lower case
# First word should be upcase
def alternating_case(str)
    words = str.split

    words.map!.with_index do |word, idx|
        if idx.even?
            word.upcase
        else
            word.downcase
        end
    end

    words.join(" ")
end

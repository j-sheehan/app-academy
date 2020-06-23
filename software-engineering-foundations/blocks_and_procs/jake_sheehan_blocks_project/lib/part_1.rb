# Jake Sheehan

def select_even_nums(num_arr)
    num_arr.select(&:even?)
end

def reject_puppies(dogs)
    dogs.reject { |dog| dog["age"] <= 2 }
end

def count_positive_subarrays(arrs)
    arrs.count { |arr| arr.sum > 0 }
end

def aba_translate(word)
    chars = word.split("")
    vowels = "aeiou"

    chars.each_with_index do |char, idx|
        chars.insert((idx + 1), ("b" + char)) if vowels.include?(char)
    end

    chars.join("")
end

def aba_array(words)
    words.map { |word| aba_translate(word) }
end
# Jake Sheehan

def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(sentence, &prc)
    words = sentence.split
    new_words = []

    words.each { |word| new_words << prc.call(word) }

    new_words.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    result_1 = prc1.call(num)
    result_2 = prc2.call(num)

    return result_1 if result_1 > result_2
    result_2
end

def and_selector(arr, prc1, prc2)
    new_arr = []
    arr.each { |ele| new_arr << ele if (prc1.call(ele) && prc2.call(ele)) }
    new_arr
end

def alternating_mapper(arr, prc1, prc2)
    new_arr = []

    arr.each_with_index do |ele, idx|
        new_arr << prc1.call(ele) if idx.even?
        new_arr << prc2.call(ele) if idx.odd?
    end

    new_arr
end
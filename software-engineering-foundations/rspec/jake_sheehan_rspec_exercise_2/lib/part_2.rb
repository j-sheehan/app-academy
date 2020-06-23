# Palindrome? function; returns bool
def palindrome?(word)
    reversed = ""

    i = word.length - 1
    while i >= 0
        reversed += word[i]
        i -= 1
    end

    word == reversed
end

# Substrings function; returns array
def substrings(str)
    array = []

    (0..str.length).each do |i|
        ((i + 1)..str.length).each do |j|
            array << str[i...j]
        end
    end

    array
end

# palindrome substring function; returns array
def palindrome_substrings(word)
    palin_subs = []
    subs = substrings(word)

    subs.each do |substring|
        if substring.length > 1
            palin_subs << substring if palindrome?(substring)
        end
    end

    palin_subs
end
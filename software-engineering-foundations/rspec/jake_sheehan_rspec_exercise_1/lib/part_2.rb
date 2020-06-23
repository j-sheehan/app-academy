$vowels = "aeiou"

# Returns hipster version of a word
def hipsterfy(word)
    chars = word.split("")

    i = chars.length - 1
    while i >= 0
        if $vowels.include?(chars[i])
            chars.delete_at(i)
            break
        end
        i -= 1
    end

    chars.join("")
end
p hipsterfy("tonic")

# description
def vowel_counts(str)
    hash = Hash.new(0)
    chars = str.downcase.split("")

    chars.each do |char|
        hash[char] += 1 if $vowels.include?(char)
    end

    hash
end

# description
def caesar_cipher(message, num)
    alphabet = ('a'..'z').map { |char| char}
    cipher = Hash.new

    alphabet.each_with_index do |letter, idx|
        cipher[letter] = alphabet[(idx + num) % alphabet.length]
    end

    message.each_char.with_index do |char, idx|
        message[idx] = cipher[char] if alphabet.include?(char)
    end
    
    message
end
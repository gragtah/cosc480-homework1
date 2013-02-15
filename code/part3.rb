def combine_anagrams(words)
    words.group_by{|str| str.downcase.chars.sort}.values
end

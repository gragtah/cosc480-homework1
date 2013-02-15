def palindrome?(str)
    (test = str.gsub(/\W/, '').downcase) == test.reverse
end

def count_words(str)
    a = str.downcase.split(/\W+/)
    h = Hash.new(0)
    a.each do |item|
            h[item] += 1
    end
   
    return h
end

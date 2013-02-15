class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
  def method_missing(method_id, second=nil)
    val = (second==nil ? method_id : second)
    singular_currency = val.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
     if method_id.to_s == "in" 
       self/@@currencies[singular_currency]
     else
      self * @@currencies[singular_currency]
     end
    else
     super 
    end
  end
end

class String
  def palindrome?
    (test = self.gsub(/\W/, '').downcase) == test.reverse
  end
end

module Enumerable
  def palindrome?
    out = ""
    self.each do |x| out+=x.to_s end
    (test = out.gsub(/[\W]/, '').downcase) == test.reverse
    # or just out.palindrome? if we can use the modified class String above
  end
end

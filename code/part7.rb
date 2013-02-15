class CartesianProduct
  include Enumerable
  def initialize(a, b)
    @output = []
    a.each do |i| 
        b.each do |j|
            @output << [i,j]
        end
    end
  end

  def each
    @output.each do |i| 
        yield i
    end
  end

end

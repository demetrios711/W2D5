class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    sum = 0
    self.each do |x|
      sum+=x
    end
    sum.hash
  end
end

class String
  def hash
    dog = ''
    self.each_char do |char|
      dog += char
    end 
    dog.reverse! 
    dog.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.map
  end
end

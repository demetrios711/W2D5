require 'byebug'
class MaxIntSet

  attr_accessor :store

  def initialize(max)
    @store = Array.new(max){false}
  end

  def insert(num)
    raise "Out of bounds" if num > store.length || num < 0
    @store[num] = true
  end

  def remove(num)
    raise "Out of bounds" if num > store.length || num < 0
    @store[num] = false
  end

  def include?(num)
    raise "Out of bounds" if num > store.length || num < 0
    return true if store[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  attr_accessor :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    idx = num % store.length
    store[idx] << num
  end

  def remove(num)
    idx = num % store.length
    store[idx].delete(num)
  end

  def include?(num)
    idx = num % store.length
    return true if store[idx].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet

  attr_accessor :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    idx = num % store.length
    if !store[idx].include?(num)
      store[idx] << num 
      @count += 1
      if count > num_buckets
        resize!
      end
    end
  end

  def remove(num)
    idx = num % store.length
    if store[idx].include?(num)
      store[idx].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    idx = num % store.length
    return true if store[idx].include?(num)
  end


  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  # debugger
    @count = 0
    print @store
    flat_store = @store.flatten
    @store = Array.new(num_buckets*2){Array.new}
    flat_store.each do |num|
      if !num.nil?
        self.insert(num)
      end
    end
  end
end

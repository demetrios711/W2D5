class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return false unless @store << [key, nil]
  end

  def include?(key)
    @store.each {|buckyboy| return true if buckyboy.include?(key) }
    false
  end

  def remove(key)
    @store.each do |arr|
      if arr.include(key)
        arr.delete(self)
        count -= 1
      end
    end

  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end

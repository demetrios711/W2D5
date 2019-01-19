class Array

  def in_order?
    (0..length-2).none? { |i| self[i] > self[i+1] }
  end
  
  def bogo_sort
    copy = self.dup
    copy.shuffle! until copy.in_order?
    copy
  end

end

require 'benchmark'

def foo
    time = Benchmark.measure {
        test_array = []
        14.times { test_array << rand(10) }
        p test_array.bogo_sort
    }
    puts time.real #or save it to logs
end

foo

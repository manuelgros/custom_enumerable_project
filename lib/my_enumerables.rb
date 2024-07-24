module Enumerable
  # Your code goes here
  def my_each_with_index
    idx = 0
    self.my_each do |num|
      yield(num, idx)
      idx += 1 
    end
  end

  def my_select
    return_arr = []
    self.my_each do |num|
      return_arr << num if yield(num)
    end

    return_arr
  end

  def my_all?
    self.my_each do |num|
      return false unless yield num
    end
    
    true
  end

  def my_any?
    self.my_each do |num|
      return true if yield num
    end

    false
  end

  def my_none?
    self.my_each do |num|
      return false if yield num
    end

    true
  end

  def my_count
    count = 0
    if block_given?
      self.my_each do |num|
        count += 1 if yield num
      end
      return count
    end
    self.my_each do |num|
      count += 1
    end
    count
  end

  def my_map
    return_arr = []
    self.my_each do |num|
      return_arr << yield(num)
    end
    return_arr
  end

  def my_inject(accumulator = 0)
    self.my_each do |num|
      accumulator = yield(accumulator, num)
    end
    accumulator
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
   for i in 0..self.size - 1
    yield self[i]
   end

   self
  end
end
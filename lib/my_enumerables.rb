module Enumerable
  def my_each
    return to_enum unless block_given?
        i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    return to_enum unless block_given?
    i = 0
    while i < self.length
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_map
    return to_enum unless block_given?
    array_to_return = []
    i = 0
    while i < self.length
      array_to_return << yield(self[i])
      i += 1
    end
    array_to_return
  end

  def my_count(arg=nil)
    count = 0
    for elem in self
      if arg
        if elem == arg
          count += 1
        end
      elsif block_given?
        count += 1 if yield(elem) == true
      else
        count += 1
      end
    end
    count
  end
end



# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
end

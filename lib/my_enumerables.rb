module Enumerable
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

  def my_select
    return to_enum unless block_given?
    array_to_return = []
    for elem in self
      array_to_return << elem if yield(elem)
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
        count += 1 if yield(elem)
      else
        count += 1
      end
    end
    count
  end

  def my_all?(pattern=nil)
    self.my_each do |elem|
      if pattern
        return false unless pattern === elem
      elsif block_given?
        return false unless yield elem
      else
        return false unless elem
      end
    end
    true
    # block = block_given? ? ->(elem) { yield elem } : ->(elem) { pattern === elem } 
    # self.my_each { |elem| return false unless block.call(elem) }
    # true
  end

  def my_any?(pattern=nil)
    block_given? ? block = ->(elem) { yield elem } : block = ->(elem) { elem }
    block = ->(elem) { pattern === elem } if pattern
    self.my_each { |elem| return true if block.call(elem) }
    false 
  end

  def my_none?(pattern=nil)
    block_given? ? block = ->(elem) { yield elem } : block = ->(elem) { elem }
    block = ->(elem) { pattern === elem } if pattern
    self.my_each { |elem| return false if block.call(elem) }
    true
  end

  def my_inject
  end
end



# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    return to_enum unless block_given?
        i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    self
  end
end

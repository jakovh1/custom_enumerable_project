module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for c in 0..(self.length - 1) do
      yield(self[c])
    end
    self
  end

  def my_each_with_index
    for c in 0..(self.length - 1) do
      yield(self[c], c)
    end
    self
  end

  def my_select
    result = []
    for c in 0..(self.length - 1) do
      result.push(self[c]) if yield(self[c])
    end
    result
  end

  def my_all?
    counter = 0
    self.each do |element|
      counter += 1 if yield(element)
    end
    self.length == counter
  end

  def my_any?
    self.each do |element|
      return true if yield(element)
    end
    false
  end

  def my_none?
    self.each do |element|
      return false if yield(element)
    end
    true
  end

  def my_count
    counter = 0
    if block_given?
      self.each do |element|
        counter += 1 if yield(element)
      end
      counter
    else
      self.length
    end
  end

  def my_map
    arr = []
    self.each do |element|
      arr.push(yield(element))
    end
    arr
  end

  def my_inject(init = nil)
    acc = init.nil? ? self[0] : init
    index = init.nil? ? 1 : 0
    for c in index..(self.length - 1)
      acc = yield(acc, self[c])
    end
    acc
  end
end

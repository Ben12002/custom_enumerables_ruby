module Enumerable
  # Your code goes here
  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
    i = 0
    new_arr = []
    while i < self.length
      condition = yield(self[i])
      new_arr.push(self[i]) if condition
      i += 1
    end
    new_arr
  end

  def my_all?
    i = 0
    while i < self.length
      condition = yield(self[i])
      return false unless condition
      i += 1
    end
    true
  end

  def my_any?
    i = 0
    while i < self.length
      condition = yield(self[i])
      return true if condition
      i += 1
    end
    false
  end

  def my_none?
    i = 0
    while i < self.length
      condition = yield(self[i])
      return false unless !condition
      i += 1
    end
    true
  end

  def my_count
    i = 0
    counter = 0
    if block_given?
      while i < self.length
        condition = yield(self[i])
        counter += 1 if condition
        i += 1
      end
      return counter
    else
      self.length
    end
  end

  def my_map
    i = 0
    new_arr = []
    while i < self.length
      new_arr.push(yield(self[i]))
      # self[i] = yield(self[i]) would modify original array
      i += 1
    end
    new_arr
  end

  def my_inject(initial_value=self[0])
    acc = initial_value
    i = 0
    while i < self.length
      acc = yield(acc, self[i])
      i += 1
    end
    acc
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    self
  end
end

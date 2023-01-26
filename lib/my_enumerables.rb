module Enumerable
  # Your code goes here
  def my_each_with_index
    if block_given?
      i = 0
      for element in self
        yield element, i
        i += 1
      end
    else
      element
    end
  end

  def my_select
    array = []

    my_each { |element| array.push(element) if yield element } if block_given?

    array
  end

  def my_all?
    my_boolean = true
    if block_given?
      my_each { |element| my_boolean = false unless yield element }
    end
    my_boolean
  end

  def my_any?
    my_boolean = false
    if block_given?
      my_each { |element| my_boolean = true if yield element }
    end
    my_boolean
  end

  def my_none?
    my_boolean = true
    if block_given?
      my_each { |element| my_boolean = false if yield element }
    end
    my_boolean
  end

  def my_count
    counter = 0
    if block_given?
      my_each { |element| counter += 1 if yield element }
    else
      counter = size
    end
    counter
  end

  def my_map
    my_array = []
    my_each { |element| my_array.push(yield element) } if block_given?
    my_array
  end

  def my_inject(initial)
    total = initial
    if block_given?
      my_each do |element|
        total = yield total, element
      end
    end
    total
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    if block_given?
      for element in self
        yield element
      end
    else
      element
    end
  end
end

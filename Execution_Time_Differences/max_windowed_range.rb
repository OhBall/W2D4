def naive_range(arr,ws)
  max_range = nil

  arr.each_with_index do |_, i1|
    slice=arr[i1...i1+ws]
    current_range= slice.max - slice.min
    max_range||=current_range
    max_range = current_range if current_range > max_range
    break if i1+ws == arr.length
  end
  max_range
end

class MyQueue
  def initialize
    @store = []
  end
  def enqueue(el)
    @store.push(el)
  end
  def dequeue # isn't this O(n)?
    @store.shift
  end
  def peek
    @store[0]
  end
  def empty?
    @store.empty?
  end
end

class MyStack
  def initialize
    @stack = []
  end
  def peek
    @stack.last
  end
  def size
    @stack.length
  end
  def pop
    @stack.pop
  end
  def push(el)
    @stack.push(el)
  end
end

class StackQueue


  def dequeue
    if stack2.empty?
      until stack1.empty
        stack2.push(stack1.pop)
      end
    end
    stack2.empty? ? nil : stack2.pop
  end

  def enqueue(el)
    stack1.push(el)
  end

  def size
    stack1.size+stack2.size
  end

end

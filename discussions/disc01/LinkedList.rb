class Node
  attr_accessor :val, :next

  def initialize(val, next_node)
    @val = val
    @next = next_node
  end
end

class LinkedList
  attr_accessor :head

  def initialize(val)
    @head = Node.new(val,nil)
  end

  def add(val)
    current = @head
    while current.next != nil
      current = current.next
    end
    current.next = Node.new(val, nil)
  end

  def to_str()
    elements = []
    temp = @head
    while temp != nil
      elements << temp.val
      temp = temp.next
    end
    return elements.inspect
  end
end

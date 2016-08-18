require 'byebug'

class BinaryMinHeap
  def initialize(&prc)

  end

  def count
  end

  def extract
  end

  def peek
  end

  def push(val)
  end

  protected
  attr_accessor :prc, :store

  public
  def self.child_indices(len, parent_index)
    child1 = (2*parent_index + 1 >= len) ? [] : [2*parent_index + 1]
    child2 = (2*parent_index + 2 >= len) ? [] : [2*parent_index + 2]

    child1.concat(child2)
  end

  def self.parent_index(child_index)
    raise Exception.new("root has no parent") if child_index == 0
    (child_index - 1)/2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new {|parent, child| parent <=> child}
    parent = array[parent_idx]
    child_indices = self.child_indices(len, parent_idx)
    children = [array[child_indices.first], array[child_indices.last]]
    while children.any? {|child| prc.call(parent, child) > 0}
      min_child_idx = array.index(children.min(&prc))
      array[parent_idx], array[min_child_idx] =
        children.min(&prc), parent
      parent_idx = array.index(parent)
      child_indices = self.child_indices(len, parent_idx)
      return array if child_indices.empty?
      children = [array[child_indices.first], array[child_indices.last]]
    end
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new {|child, parent| child <=> parent}
    child = array[child_idx]
    parent_idx = self.parent_index(child_idx)
  end
end

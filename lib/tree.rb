class Tree
  attr_reader :value, :left, :right

  def initialize(value, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end

  def self.make_tree(array)
    return nil if array.empty?
    m = array.length / 2
    Tree.new(array[m], make_tree(array[0...m]), make_tree(array[m+1...array.length]))
  end

  # if I can't use array slices
  def self.make_tree2(a,b,e) # array, [beginning,end)
    return nil if b >= e
    m = (e - b) / 2 + b
    Tree.new(a[m], make_tree2(a,b,m), make_tree2(a,m+1,e))
  end

  def preorder
    ([value, left ? left.preorder : '', right ? right.preorder : ''] - ['']).flatten
  end

  def inorder
    ([left ? left.inorder : '', value, right ? right.inorder : ''] - ['']).flatten
  end

  def postorder
    ([left ? left.postorder : '', right ? right.postorder : '', value] - ['']).flatten
  end

  def self.isbalanced? (tree)
    return true if tree.nil?
    return false if (depth(tree.left) - depth(tree.right)).abs > 1
    isbalanced?(tree.left) && isbalanced?(tree.right)
  end

  def depth
    return 1 if left.nil? && right.nil?
    1 + [left ? left.depth : 0, right ? right.depth : 0].max
  end

  def self.depth (tree)
    return 0 if tree.nil?
    1 + [depth(tree.left), depth(tree.right)].max
  end
end


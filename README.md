Binary tree (ruby)
==================
It's simply a Ruby implementation of binary tree data structure.
Just for ~~trying~~ compiling Ruby 2.0 and do some TDD.

Implementation from [C Binary Tree with an Example C Code (Search, Delete, Insert Nodes)](http://www.thegeekstuff.com/2013/02/c-binary-tree/)

How binary tree works
---------------------
Binary tree is composed by nodes. Nodes can have two child nodes and every child can have another children... to the infinite (more or less).


Root nodes are greater than its children. 

Child nodes which are lesser than root node should be on the left side.

Child nodes which are greater than root node should be on the right side.

(ascii)Graphical example:
<pre>
       _9_
     _/   \_
  _4_       _15_
 /   \     /    \
2     6   12    17
</pre>

Features / TODO list
--------------------
  - [x] Create a binary tree
  - [x] Search into binary tree
  - [x] Delete binary tree
  - [x] Displaying binary tree as an array (pre-order, in-order and post-order)
  - [ ] Displaying binary tree as an ascii tree
  - [ ] Refactor in a ruby-ish way

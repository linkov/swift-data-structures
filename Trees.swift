/*

How to represent a rooted tree (think website files' hierarchy) as a data structure for computers
=================================================================================================

* Simplest approach *
- Each node has 3 references:
1) item stored in the node
2) parent of the node
3) list of all children of the node

* More interesting approach *
Pro: list data structure is built in to the nodes of the tree so this one uses less memory
Contra: does not reuse list code (?: clarify)

- Each node has 3 references:
1) item stored in the node
2) parent of the node
3) siblings are directly linked to each other, so we can store reference to first child only



Tree Traversals
===============

Traversal: a manner of visiting each tree node in a tree once

Types of traversals

- Preoder traversal
Visits each node, then recursively visit it's children left to right. Root visited first (see preoder() )
Each node visited only once, so a preorder traversal takes O(n) time, where n is the number of nodes in the tree

- Postorder traversal
Visits each node's children (left to right) before the node itself (see postorder() ). Deepest child visited first.
Postorder is efficient for, for example, getting the sum of all subnodes b/c to do this you better start from the bottom and get the info on subnodes and them summing up on their parent level
Postorder traversal takes O(n) time, where n is the number of nodes in the tree


- Level order traversal
Visits the root. Then visit all depth 1 nodes from left to right, then visit all depth2 nodes, etc. ...
Implementation: 
1) take a queue (a list in which you add items to the end and take items off the top), which initially contains only the root.
2) Repeat until queue is empty:
- deque a node from the front of the list
- visit the dequed node
- enque it's children from left to right at the end of the list





Binary Search trees (one of main uses for binary trees)
================================================

Binary search tree is what you use to implement ordered dictionary abstract data type
- ordered dictionary is a dictianary in which keys are ordered
- insert, find, remove any entry like in a hash table but not quite as fast
- quickly (not as fast as balanced search trees) find an entry with a min or max key
- find entry nearest to other entry (EX: find similar words in thesaurus, find entries <= 33)

Binary Search Tree Properties
- BST Invariant
For any node x, every key in leftside subtree of x is less or equal to x's key
For any node x, every key in right subtree of x is greater or equal to x's key
This rule applies at every level of the tree, so if there's only 1 child node somewhere down the rule should be applied to determine if it should be left or right child

- Inorder traversal (for binary search tree)
Visits nodes in sorted order in O(n) time: first left subtree, then self, then right subtree. All nodes less than x visited before x and all nodes greater than x visited after x. So Binary Search Tree keeps your numbers sorted

Operations
- Find
For exact matches it is faster to use hashtable, binary search tree is good for things like:
find smallest key >= k, find largest key =< k, we encounter those naturally as we go down the binary search tree in find()
- Find min and max keys in the tree
first()
last()
- Insert
- Delete


Running times
Best case: For perfectly balanced tree insert,find, remove takes O(log n) time, that is time propotional to depth of deepest node visited
Worst case: if we, for ex, insert nodes with keys and each of the keys is bigger than the prev key we will get very unbalanced tree
all operations will take O(n) time, it's easy to imagine that you insert already sorted array and that's how you end up with bad tree

Resorces:
========

http://www.youtube.com/watch?v=evwGnROlB58&list=PL4BBB74C7D2A1049C&index=23
http://youtu.be/V_3BM0ykITM?list=PL4BBB74C7D2A1049C
http://codingforinterviews.com/

*/

import Foundation

// MARK: - Base classes

class treeObject :NSObject {
    var key:Int?
    var value:AnyObject?

    convenience init(objectKey: Int) {

        self.init()
        self.key = objectKey
    }
}

class SDWTree: NSObject {
    var root:SDWTreeNode?

    convenience init(root: SDWTreeNode) {

        self.init()
        self.root = root
    }

}

class SDWTreeNode: NSObject {
    var entry:treeObject?
    var dataObject:AnyObject?
    var parent:SDWTreeNode?

    convenience init(data: AnyObject) {
        self.init()
        self.dataObject = data
    }


    convenience init(treeObj: treeObject) {
        self.init()
        self.entry = treeObj
    }

    /* visit means doing anything with the node, like simply printing data or doing compute */
    func visit() ->Void {}
}


// MARK: - Subclasses


class BinaryTree: SDWTree {

//    var arr:[Int] = []
//
//    func isBST() ->Bool {
//
//        return self.toArray().isSorted(<)
//    }
//
//    func toArray() ->Array<Int> {
//
//        addNode(self.root as? BinaryTreeNode)
//        return arr
//    }
//
//    func addNode(node: BinaryTreeNode?) ->Void {
//        if (node != nil) {
//            addNode(node?.leftChild);
//            arr.append(node!.entry!.key!)
//            addNode(node?.rightChild)
//
//        }
//    }

//    func isValidBST(node: BinaryTreeNode) ->Bool {
//
//        if (node.entry?.key > node.leftChild?.entry?.key && node.entry?.key < node.rightChild?.entry?.key) {
//
//            return isValidBST(node.leftChild!)
//        } else {
//
//        }
//
//        return false
//    }

}
class BinarySearchTree :SDWTree {

    func find(key: Int) ->treeObject? {

        var node:BinaryTreeNode? = self.root as? BinaryTreeNode
        while (node != nil) {

            if (key < node?.entry?.key) {
                node = node?.leftChild
            } else if (key > node?.entry?.key) {
                node = node?.rightChild
            } else if (key == node?.entry?.key) {
                return node?.entry
            }
        }

        return nil
    }

    func first() ->treeObject? {

        /*
        
        If tree is empty return null
        Othrerwise start at the root and repeatedly go to the left child until you reach node that does not have a leftChild
        return the key of the node you stopped at
        */

        return nil
    }

    func last() ->treeObject? {

        /*

        If tree is empty return null
        Othrerwise start at the root and repeatedly go to the right child until you reach node that does not have a rightChild
        return the key of the node you stopped at
        */

        return nil
    }

    func insert(key:Int,value:AnyObject) ->treeObject? {

        /*
        
        Follow same path through the tree as find()
        When you reach a nil ref, replace it with new node with treeObject with key value from func params
        Duplicate keys allowed, puts new entry in the left/or right subtree of old one

        */

        return nil
    }

    func remove(key:Int) ->treeObject? {

        /*
        
        Find a node n with key k
        Return nil if key not in tree
        If n has no children, detach it from it's parent
        If n has 1 child, move n's child up to take n's place
        
        If the node n that we want to remove has two children:
        Let x be the node in n's right subtree with the smallest key (to find smallest in binary tree just keep going to the left)
        Remove x, since x has no child it's easily removed
        Replace n's key with x's key
        */

        return nil
    }
}

class BinaryTreeNode: SDWTreeNode {

    var leftChild:BinaryTreeNode?
    var rightChild:BinaryTreeNode?
//    var arr:[String] = []
//
//    func isBST() ->String {
//
//        var str:String?
//
//        if((self.leftChild) != nil) {
//
//            self.leftChild!.isBST()
//        }
//
//        str = self.dataObject as? String
//
//        if((self.rightChild) != nil) {
//
//            self.rightChild!.isBST()
//        }
//
//
//        return str!
//    }

    func inorder()->Void {


        if((self.leftChild) != nil) {

            self.leftChild!.inorder()
        }

        self.visit()

        if((self.rightChild) != nil) {

            self.rightChild!.inorder()
        }

    }

    override func visit() ->Void {
        print("\(dataObject!) ->", appendNewline: false)
    }

}



class SibTree: SDWTree {

    override var description: String {
        return self.printTreePreorder(self.root as? SibTreeNode, depth: 0)
    }

    func printTreePreorder(node :SibTreeNode?,depth: Int) ->String {

        if (node == nil) {
            return ""
        }

        var str:String = ""

        for i in 0...depth {
            str = str + "  ";
        }

        var nodeDataStr:String = node?.dataObject as! String
        var preorderFirstChild:String = ""
        var preorderNextSib:String = ""

        if (node?.firstChild != nil) {

            preorderFirstChild = printTreePreorder(node!.firstChild!,depth: depth + 1)
        }

        if (node?.nextSibling != nil) {

            preorderNextSib = printTreePreorder(node!.nextSibling!,depth: depth)
        }

        return "\(str)\(nodeDataStr)\n\(preorderFirstChild)\(preorderNextSib)"
        
    }
    
}

class SibTreeNode: SDWTreeNode {
    var firstChild:SibTreeNode?; // one of the children of this node
    var nextSibling:SibTreeNode?; // points to a node that is at the same depth (same level) as this node

    func preoder() ->Void {

        self.visit()

        if((self.firstChild) != nil) {
            self.firstChild!.preoder() // visit children recursively
        }

        if((self.nextSibling) != nil) {
            self.nextSibling!.preoder() // when we are done with children lets visit siblings
        }

    }

    func postorder()->Void {

        if((self.firstChild) != nil) {
           self.firstChild!.postorder()
        }

        self.visit()

        if((self.nextSibling) != nil) {
            self.nextSibling!.postorder()
        }

    }

}
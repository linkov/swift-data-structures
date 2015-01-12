/*

How to represent a rooted tree (think website files' hierarchy) as a data structure for computers
=================================================================================================

--- Simplest approach ---
- Each node has 3 references:
1) item stored in the node
2) parent of the node
3) list of all children of the node

--- More interesting approach ---

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
Visit each node, then recursively visit it's children left to right. Root visited first (see preoder() )


Resorces:
========

http://www.youtube.com/watch?v=evwGnROlB58&list=PL4BBB74C7D2A1049C&index=23
http://codingforinterviews.com/

*/

import Foundation

class SibTree {
    var root:SibTreeNode!
    var size:Int! // number of nodes in a tree

    convenience init(size: Int, root: SibTreeNode) {

        self.init()
        self.size = size
        self.root = root
    }
    
}

class SibTreeNode {
    var dataObject:AnyObject?;
    var parent:SibTreeNode?;
    var firstChild:SibTreeNode?; // one of the children of this node
    var nextSibling:SibTreeNode?; // points to a node that is at the same depth (same level) as this node

    convenience init(data: AnyObject) {
        self.init()
        self.dataObject = data
    }

    func preoder() ->Void {

        self.visit()

        if((self.firstChild) != nil) {
            self.firstChild!.preoder() // visit children recursively
        }

        if((self.nextSibling) != nil) {
            self.nextSibling!.preoder()
        }

    }

    /* visit means doing anything with the node, like simply printing data or doing compute */
    func visit() ->Void {

    }
    
}
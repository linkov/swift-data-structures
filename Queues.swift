/*

Queue
=====

Priority queue (abstract data type)
==============

Operations
- Identify or remove entry whose key is the lowest
- Insert any key at any time
- Bottom-up heap construction


Usage
- as 'event queues' in simulations (key is the time when the event is going to take place, value is the description of the event)
1) For ex: we know that in the event of forest fire, second tree will light up 3 min after first, fire fighters will arrive 30 min after first tree cought fire
2) keep puting events on priority queue with timestamp, when time comes the event will be processed

3) Suppose you are given a bunch of events in random order and you want to make a heap out of them, you use Bottom-up heap construction
- simple way is to insert them 1 by 1, it will take O(n) for 1 insert and for whole operation it can take O(log n) time
- there's a way to do the whole op in linear time O(n), see bottomUpHeap()




Implementations VS operation time min() | insert() | removeMin()

- Simplest and efficient implementation uses Binary Heap data structure | O(1) | wc O(log n) b/c tree can have many levels, bc O(1) | wc O(log n) b/c tree can have many levels, bc O(1) if all items have the same key

- Sorted array | O(1) | wc O(n) b/c we need to push all items 1 up, bc O(1) | wc O(1), bc O(1)

- Unsorted array | O(n) | wc O(1), bc O(n) | wc O(n), bc O(n)

Binary Heap (particular implementation of priority queue data type)
===========
What is Binary Heap?
1) It's a complete binary tree (complete means a tree in which every level is full, exept possibly the very bottom level which is filled from left to right )
2) Every subtree of a binary heap a binary heap
3) Entries in Binary Heap satisfy heap-order property: no child has a key that is less than it's parent's key
4) All levels of the tree are often stored as array populated by level-order traversal (each level written from left to right, index 0 is left empty )
5) Mapping of nodes to indices: level numbering
- Node i's children are 2i and 2i+1
- Node i's parent is floor(i/2)
6) Storing values can be done in two ways
- each tree node has 2 references (key,value) -> this needs 2 arrays, one for keys and one for values
- each tree node has a reference to entry object, and the object has references to key and value

Resorces:
========

http://www.youtube.com/watch?v=yIUFT6AKBGE&list=PL4BBB74C7D2A1049C&index=24
*/

import Foundation

class Queue: NSObject {

    var data:Array<AnyObject>?

}

class PriorityQueue: Queue {

    func bottomUpHeap() ->Void {

        /*
        
        1) Make a complete tree out of entries in any order, for array backed heap just put all in array
        2)Fix the heap
        - Walk backward through the array from the last internal node (internal means not a leaf) to the root
        Meaning you walk through all elements in array in reverse order
        For each internal node you visit you bubble it's entry down like in removeMin()

        */
    }

    func removeMin() ->Dictionary<Int,AnyObject>? {
        // remove min item
        // return (key,value) that just got removed

        /*
        
        Remove entry at the root node (b/c of the heap-order property the min key is always at the root)
        Save it for the return value
        Before returning we have to fix the heap b/c we removed the root
        Fill the hole with the last entry in the tree, last right most at the bottom level (let it be x)
        To fix heap-order property bubble x down the heap
        Repeat:
        If x is greater than one or both of it's children then swap x with it's min child
        
        Good news is that the min key for a whole subtree is either left or right child of root so we don't have to go far


        */


        return nil
    }

    func insert(key:Int,value: AnyObject) ->Void {
        /*
        Let x be new entry (key,value)
        Start by placing x at the bottom of the tree at first open spot, if no place, start new level and place key on far left
        Meaning you insert new entry as new object in storage array
        The problem is that if we insert at the bottom we can violate heap-order property
        The way to fix this is to bubble up the entry up the heap until heap-order property is satisfied
        Repeat:
        - compare x key to it's parent's key
        - x's key is less we exchange x with it's parent
        
        */
    }

    func min() ->Dictionary<Int,AnyObject>? {

        // heap-order property guarantees that the min is always at the root of the tree, return entry at the root
        return nil
    }
    
}

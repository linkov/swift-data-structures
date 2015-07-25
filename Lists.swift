/*


Linked Lists
============

There are disadvantages of storing a list of items in array

1. Inserting item in the beginning or middle takes time proportional to length of array. For sorted array you would have to move each item from the end up to insert location and then insert new item in the freed spot
2. Arrays have a fixed length. To insert new item we need to allocate new array with new lendth and copy everything from old array



Linked List is a recursive data type: definition of linked list node will refer to linked list node it self.
Linked List is a list that's made up of data structures called 'nodes'.
Each node stores 2 things:
- an item
- a reference to the next node in the list



Advantages of Linked Lists over arrays

1. Inserting an item in the middle of linked list takes small constant amount of time if you have reference to previous node
2. List can keep growing


Disadvantages of Linked Lists over arrays

1. Finding the Nth item of a linked list takes time proportional to number of items in the list. In arrays it takes constant-time

//So, in arrays it's easy to find an item but hard to insert, in linked lists the opposite. More advanced data structures like hash tables and trees are ways to find balance between insertion time and find time


Motivation for separate List class (in addition to ListNode class)

1. There are 2 problems with just having ListNode class
- Suppose x and y both point to ListNode milk, we insert new item like this x = ListNode('soap',x), now x points to soap and milk list, but y still point to only milk
- How do you represent an empty list? x=nil ? Problem with this is that if we try to call any of list methods on x we will have a runtime error

Solution to these problems is a sepatate List class that maintains head of the list. Both x and y then will point to List object (see below) and conflicts will be resolved


2. List class enforces 2 invariants:

//Invatiant: a fact about a data structrure ( a class ) that is always true
//A Date class inforces the invariant that a date object always represent a valid date. You made Date class in a way that it's impossible for outside class to come in and construct a Date class object that refers to invalid date
- 'Size' is always equal to the number of items you can get to starting from the head pointer and following the chain of 'next' pointers
- List is never circurlarly linked. You can loop following 'next' pointers and not have infinite loop b/c some node points back to one of the previous nodes. Another way to say this is: in a list you will always get to a node which next pointer is nil

These goals are accoplished b/c only List methods can change lists in any significant way. List class ensures this by:
- Head and size are private
- No method of List returns node class instance, so there is no way client can get reference to a node and modify it





Doubly Linked Lists (DLists)
============================

Inserting or deleting at front of the list is easy, how about inserting / deleting at the end of a list?
You don't have pointer to the end of the list so you have to start at the head and walk all the way to the end


Resorces:
========

https://www.youtube.com/watch?v=htzJdKoEmO0&index=7&list=PL4BBB74C7D2A1049C
*/


import Foundation


class SDWList: NSObject {

    var head:SDWListNode? = nil
    var size: Int = 0

    func insertFront(item: AnyObject) ->Void {

        self.head = SDWListNode(data: item, next:head)
        self.size += 1
    }

    func deleteFront() ->Void {

        if (self.head !=  nil) {
            self.head = self.head!.next
            self.size -= 1

        }
    }

}

class SDWListNode: NSObject {
    var item:AnyObject?
    var next:SDWListNode?

    convenience init(data: AnyObject, next: SDWListNode?) {
        self.init()
        self.item = data
        self.next = next
    }

    convenience init(data: AnyObject) {
        self.init(data: data,next: nil)
    }

    func insertAfter(data: AnyObject) ->Void {
        self.next = SDWListNode(data: data, next: self.next)

    }

    func nth(position: Int) -> SDWListNode? {

        if position == 1 {
            return self;
        }

        if (position < 1 || next == nil) {

            return nil
        }

        return self.next?.nth(position - 1)
    }

}





class SDWDListNode :NSObject {
    var item:AnyObject?
    var next:SDWDListNode?
    var prev: SDWDListNode?

}


class SDWDList :NSObject {
    var head:SDWDListNode? = nil
    var tail:SDWListNode? = nil
    var size: Int = 0
}
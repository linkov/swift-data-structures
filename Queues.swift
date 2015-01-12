/*

Queue
=====

Priority queue
==============

Operations
- Identify or remove entry whose key is the lowest
- Insert any key at any time


Usage
- as 'event queues' in simulations (key is the time when the event is going to take place, value is the description of the event)
1) For ex: we know that in the event of forest fire, second tree will light up 3 min after first, fire fighters will arrive 30 min after first tree cought fire
2) keep puting events on priority queue with timestamp, when time comes the event will be processed

Resorces:
========

http://www.youtube.com/watch?v=yIUFT6AKBGE&list=PL4BBB74C7D2A1049C&index=24
*/

import Foundation

class Queue:NSObject {

}

class PriorityQueue:Queue {

    func removeMin() ->Dictionary<Int,AnyObject>? {
        // remove min item
        // return (key,value) that just got removed
        return nil
    }

    func min() ->Dictionary<Int,AnyObject>? {

        // just return the smallest entry (key,value)
        return nil
    }
    
}

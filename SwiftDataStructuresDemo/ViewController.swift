

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        basicDemos()
        practicalExamples()
    }

    func basicDemos() ->Void {

        //self.setupSibTreeAndPrint()
        //self.setupHashTableAndPrint()
        //self.setupBinaryExpressionTreeAndPrint()
     //   self.setupBinarySearchTreeAndPrint()
        self.setupLinkedListAndPrint()
    }

    func practicalExamples() ->Void {

        // Practical examples should take advantage of specific properties of a data structure

    }

    func setupLinkedListAndPrint() ->Void {

//        let l1:SDWListNode = SDWListNode()
//        l1.item = "seven"
//
//        let l2:SDWListNode = SDWListNode()
//        l2.item = "zero"
//
//        let l3:SDWListNode = SDWListNode()
//        l3.item = "six"
//
//        l1.next = l2
//        l2.next = l3
//        l3.next = nil

        let l1:SDWListNode = SDWListNode(data: "seven", next: SDWListNode(data: "zero", next: SDWListNode( data: "six")    )    )

        var l1ref = l1

        let moreNumbers = ["one", "eight", "five"]

        for numberString in moreNumbers {

            l1ref.insertAfter(numberString)
            l1ref = l1ref.next!
        }

        print(l1.nth(1)?.item)

        let l2:SDWListNode = SDWListNode(data: "seven",next:nil)
        let l3:SDWListNode = SDWListNode(data: "nine",next:nil)

        let list:SDWList = SDWList()
        list.insertFront(l2)
        list.insertFront(l3)

        print(list.size)

    }

    func setupBinarySearchTreeAndPrint() ->Void {

        treeObject(objectKey: 12)
        let node18:BinaryTreeNode = BinaryTreeNode(treeObj:  treeObject(objectKey: 18))
        let node12:BinaryTreeNode = BinaryTreeNode(treeObj:  treeObject(objectKey: 12))
        let node25:BinaryTreeNode = BinaryTreeNode(treeObj:  treeObject(objectKey: 25))

        let node4:BinaryTreeNode = BinaryTreeNode(treeObj:  treeObject(objectKey: 4))
        let node15:BinaryTreeNode = BinaryTreeNode(treeObj:  treeObject(objectKey: 15))
        let node23:BinaryTreeNode = BinaryTreeNode(treeObj:  treeObject(objectKey: 23))
        let node30:BinaryTreeNode = BinaryTreeNode(treeObj:  treeObject(objectKey: 30))


        node18.leftChild = node12
        node18.rightChild = node25

        node12.parent = node18
        node25.parent = node18



        node25.leftChild = node23
        node25.rightChild = node30

        node23.parent = node25
        node30.parent = node25


        node12.leftChild = node4
        node12.rightChild = node15

        node4.parent = node12
        node15.parent = node12


        let bstree:BinaryTree = BinaryTree(root: node18)
        
      //  var rt:BinaryTreeNode = bstree.root as! BinaryTreeNode
       // rt.inorder()
       // rt.isBST()

       print(bstree)

    }

//    func isBST(rootNode :BinaryTreeNode) ->Bool {
//        let arrayFromTreeKeys:Array =rootNode.inorder()
//        filteredArray = moneyArray.filter({$0 > 30})
//    }


    func setupBinaryExpressionTreeAndPrint() ->Void {

        let btreeRoot:BinaryTreeNode = BinaryTreeNode(data: "+")
        let btreeSubstractNode:BinaryTreeNode = BinaryTreeNode(data: "-")
        let btreeDivideNode:BinaryTreeNode = BinaryTreeNode(data: "/")

        let node6:BinaryTreeNode = BinaryTreeNode(data: "6")
        let node5:BinaryTreeNode = BinaryTreeNode(data: "5")
        let node9:BinaryTreeNode = BinaryTreeNode(data: "9")
        let node_3:BinaryTreeNode = BinaryTreeNode(data: "3")


        btreeRoot.leftChild = btreeSubstractNode
        btreeRoot.rightChild = btreeDivideNode

        btreeSubstractNode.parent = btreeRoot
        btreeDivideNode.parent = btreeRoot



        btreeDivideNode.leftChild = node9
        btreeDivideNode.rightChild = node_3

        node_3.parent = btreeDivideNode
        node9.parent = btreeDivideNode


        btreeSubstractNode.leftChild = node6
        btreeSubstractNode.rightChild = node5

        node6.parent = btreeSubstractNode
        node5.parent = btreeSubstractNode


        let btree:BinaryTree = BinaryTree(root: btreeRoot)

        let rt:BinaryTreeNode = btree.root as! BinaryTreeNode
        rt.inorder()

    }

    func setupHashTableAndPrint() ->Void {

        let htable:SDWHashTable = SDWHashTable(maxSize:12)

        htable.addObject("Steve");
        htable.addObject("Spark");
        htable.addObject("Jane");
        htable.addObject("Notes");

        htable.removeObject("Steve");


        print(NSString(format:"contains Steve = %@", htable.containsObject("Steve")) );
        print(NSString(format:"contains Jerry = %@", htable.containsObject("Jerry")) );
        print(NSString(format:"contains Notes = %@", htable.containsObject("Notes")) );
    }

    func setupSibTreeAndPrint() ->Void {

        let rootNode:SibTreeNode = SibTreeNode(data: "/")
        let index:SibTreeNode = SibTreeNode(data: "index.hml")
        let hw:SibTreeNode = SibTreeNode(data: "hw")
        let labs:SibTreeNode = SibTreeNode(data: "labs")
        let lectures:SibTreeNode = SibTreeNode(data: "lectures")

        let tree:SibTree = SibTree(root: rootNode)


        rootNode.firstChild = index
        rootNode.nextSibling = nil

        index.parent = rootNode
        index.nextSibling = hw

        hw.parent = rootNode
        hw.nextSibling = labs

        labs.parent = rootNode
        labs.nextSibling = lectures

        lectures.parent = rootNode
        lectures.nextSibling = nil



        let lab1:SibTreeNode = SibTreeNode(data: "lab1")
        let lab2:SibTreeNode = SibTreeNode(data: "lab2")
        let hw1:SibTreeNode = SibTreeNode(data: "hw1")
        let hw2:SibTreeNode = SibTreeNode(data: "hw2")

        hw.firstChild = hw1
        labs.firstChild = lab1

        lab1.parent = labs
        lab1.nextSibling =  lab2

        lab2.parent = labs
        lab2.nextSibling = nil

        hw1.parent = hw
        hw1.nextSibling = hw2
        hw2.parent = hw
        hw2.nextSibling = nil

        print(tree.description, appendNewline: false)

    }

}


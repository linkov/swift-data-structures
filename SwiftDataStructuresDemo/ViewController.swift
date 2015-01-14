

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
        self.setupBinarySearchTreeAndPrint()
    }

    func practicalExamples() ->Void {

        // Practical examples should take advantage of specific properties of a data structure

    }

    func setupBinarySearchTreeAndPrint() ->Void {

        treeObject(objectKey: 12)
        var node18:BinaryTreeNode = BinaryTreeNode(treeObj:  treeObject(objectKey: 18))
        var node12:BinaryTreeNode = BinaryTreeNode(treeObj:  treeObject(objectKey: 12))
        var node25:BinaryTreeNode = BinaryTreeNode(treeObj:  treeObject(objectKey: 25))

        var node4:BinaryTreeNode = BinaryTreeNode(treeObj:  treeObject(objectKey: 4))
        var node15:BinaryTreeNode = BinaryTreeNode(treeObj:  treeObject(objectKey: 15))
        var node23:BinaryTreeNode = BinaryTreeNode(treeObj:  treeObject(objectKey: 23))
        var node30:BinaryTreeNode = BinaryTreeNode(treeObj:  treeObject(objectKey: 30))


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
        
        var rt:BinaryTreeNode = bstree.root as BinaryTreeNode
       // rt.inorder()
       // rt.isBST()

       println(bstree.isBST())

    }

//    func isBST(rootNode :BinaryTreeNode) ->Bool {
//        let arrayFromTreeKeys:Array =rootNode.inorder()
//        filteredArray = moneyArray.filter({$0 > 30})
//    }


    func setupBinaryExpressionTreeAndPrint() ->Void {

        var btreeRoot:BinaryTreeNode = BinaryTreeNode(data: "+")
        var btreeSubstractNode:BinaryTreeNode = BinaryTreeNode(data: "-")
        var btreeDivideNode:BinaryTreeNode = BinaryTreeNode(data: "/")

        var node6:BinaryTreeNode = BinaryTreeNode(data: "6")
        var node5:BinaryTreeNode = BinaryTreeNode(data: "5")
        var node9:BinaryTreeNode = BinaryTreeNode(data: "9")
        var node_3:BinaryTreeNode = BinaryTreeNode(data: "3")


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

        var rt:BinaryTreeNode = btree.root as BinaryTreeNode
        rt.inorder()

    }

    func setupHashTableAndPrint() ->Void {

        let htable:SDWHashTable = SDWHashTable(maxSize:12)

        htable.addObject("Steve");
        htable.addObject("Spark");
        htable.addObject("Jane");
        htable.addObject("Notes");

        htable.removeObject("Steve");


        println(NSString(format:"contains Steve = %@", htable.containsObject("Steve")) );
        println(NSString(format:"contains Jerry = %@", htable.containsObject("Jerry")) );
        println(NSString(format:"contains Notes = %@", htable.containsObject("Notes")) );
    }

    func setupSibTreeAndPrint() ->Void {

        var rootNode:SibTreeNode = SibTreeNode(data: "/")
        var index:SibTreeNode = SibTreeNode(data: "index.hml")
        var hw:SibTreeNode = SibTreeNode(data: "hw")
        var labs:SibTreeNode = SibTreeNode(data: "labs")
        var lectures:SibTreeNode = SibTreeNode(data: "lectures")

        var tree:SibTree = SibTree(root: rootNode)


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



        var lab1:SibTreeNode = SibTreeNode(data: "lab1")
        var lab2:SibTreeNode = SibTreeNode(data: "lab2")
        var hw1:SibTreeNode = SibTreeNode(data: "hw1")
        var hw2:SibTreeNode = SibTreeNode(data: "hw2")

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

        print(tree.description)

    }

}


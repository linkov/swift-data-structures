

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        basicDemos()
        practicalExamples()
    }

    func basicDemos() ->Void {

        self.setupSibTreeAndPrint()
    }

    func practicalExamples() ->Void {

        // Practical examples should take advantage of specific properties of a data structure

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


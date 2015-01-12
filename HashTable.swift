/*

Hashtable has 2 parts:

1) an array (the actual table where the data to be searched is stored) @[@"Jack" at index 0,@"Jill" at index 1]
2) mapping function, known as a hash function.

Hash function is a mapping from the input space to the integer space that defines the indices of the array. the hash function provides a way for assigning numbers to the input data such that the data can then be stored at the array index corresponding to the assigned number.

*/


import Foundation

class SDWHashTable {

    var arr:[Array<String>] = [];
    var maxArraySize = 5;

    convenience init(maxSize: Int) {

        self.init()
        self.maxArraySize = maxSize
        self.constuctDataStucture()
    }

    // MARK: - API

    func containsObject(str: String) -> Bool {

        let indexForHash = hashFromString(str, tableSize: maxArraySize)
        let arrayAtindex:Array = arr[indexForHash]

        for arrStr in arrayAtindex {
            if str == arrStr {
                return true;
            }
        }

        return false;
    }

    func addObject(str: String) -> Void {

        let indexForHash = hashFromString(str, tableSize: maxArraySize)
        var arrayAtindex:Array = arr[indexForHash]
        arrayAtindex.append(str)
        arr[indexForHash] = arrayAtindex

    }

    func removeObject(str: String) -> Void {

        let indexForHash = hashFromString(str, tableSize: maxArraySize)
        let arrayAtindex:Array = arr[indexForHash]
        arr[indexForHash] = arrayAtindex.filter( {$0 != str} )

    }

    // MARK: - private

    /* instead of simple strings we will store arrays to handle cases when hash is the same for 2 values */
    private func constuctDataStucture() -> Void {

        for index in 0...maxArraySize {

            let innerArray:Array<String> = []
            arr.insert(innerArray, atIndex: index)

        }
    }

    /* create hash from summ of unicode char numbers modulo array count */
    private func hashFromString(personName: String?, tableSize: Int) -> Int {

        if let existingName = personName {

            var summOfCharacterCodes:Int = 0
            let characterCount = existingName.utf16Count
            let charArr:Array = existingName.cStringUsingEncoding(NSUTF8StringEncoding)!

            for charNumber in charArr {
                var num:NSNumber = NSNumber(char: charNumber)
                summOfCharacterCodes +=  num.integerValue
            }
            
            return summOfCharacterCodes % tableSize
        }
        
        
        return 0
    }
}
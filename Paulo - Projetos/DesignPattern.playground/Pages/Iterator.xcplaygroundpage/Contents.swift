/*:
 [Previous](@previous)
 
 # Iterator
 - - -
 
 ![Iterator Diagram](Iterator_Diagram.png)
 
 
 
 ## Code Example
 */
import Foundation

protocol Iterator: IteratorProtocol {
    func getNext() -> String
    func hasMore() -> Bool
}


protocol IterableColletion {
    var items: [String]
    func createIterator() -> Iterator
}


class ConcreteIterator: Iterator {

    private let collection: IterableColletion
    private var index = -1

    init(_ collection: IterableColletion) {
        self.collection = collection
    }


     mutating func next() -> String? {
        index += 1
        return index < collection.items.count ? collection.items[index] : nil
    }
}


class ConcreteIteratorPar: Iterator {

    private let collection: IterableColletion
    private var index = -1

    init(_ collection: IterableColletion) {
        self.collection = collection
    }


     mutating func next() -> String? {
        index += 1
        if index % 2 == 0 {
            return index < collection.items.count ? collection.items[index] : nil
        }
        return nil
    }
}


class ConcreteCollection: IterableColletion, Sequence {

    lazy var items = [String]()

    func makeIterator() -> Iterator {
        return Iterator(self)
    }
}


var collection = ConcreteCollection()
collection.items.append("0")
collection.items.append("1")
collection.items.append("2")
collection.items.append("3")
collection.items.append("4")
collection.items.append("5")
collection.items.append("6")



//: [Next](@next)

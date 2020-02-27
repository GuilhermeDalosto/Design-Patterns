import UIKit

//protocol IterableProtocol{
//    func create() -> Iterate
//}
/*:
![iterator](iterator.png)
 
 */


protocol IteratorProtocol {
    associatedtype Element
    mutating func next() -> Self.Element?
}

struct MyCollectionIterator: IteratorProtocol {
    typealias Element = Mycollection
    
    private var myCollectios: [Mycollection]
    init(collections: [Mycollection]) {
        self.myCollectios = collections
    }
    mutating func next() -> Mycollection? {
        // TODO: Return next underlying Book element.
    }
}

struct Mycollection: Sequence{
    
    
    var nums: [Int]
    
    func makeIterator() -> MyCollectionIterator {
        return MyCollectionIterator(collections: [self])
    }
}

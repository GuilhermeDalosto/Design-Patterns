/*:
 [Previous](@previous)
 
 # Iterator
 - - -
 
 ![Iterator Diagram](Iterator_Diagram.png)
 
 É um behavioral design pattern que nos permite iterar sobre os elementos de uma collection (list, stack, tree, etc.) sem expor os componentes internos dessa collection.
 Em adição à implementar o algoritmo da iteração, o iterator encapsula todos os detalhes traversais (da iteração), como posição atual e quantos elementos ainda restam. Por conta disso, vários iterators podem ser executados ao mesmo tempo na mesma collection.
 Todos os iterators devem ser implementados da mesma interface.
 
 ## Code Example
 */
protocol MyIterator: IteratorProtocol {
    
    var collection: Locais<Element> { get set }
    var index: Int { get set }
    func hasMore() -> Bool
}


extension MyIterator {
    func next() -> Element? {
        return hasMore() ? self.collection.items[index] : nil
    }
}


class ViagemPar<Element>: MyIterator {
    
    var index: Int = -2
    var collection: Locais<Element>
    
    init(_ collection: Locais<Element>) {
        self.collection = collection
    }
    
    
    func hasMore() -> Bool {
        
        defer { self.index += 2 }
        if index + 2 < self.collection.items.count {
            return true
        }
        return false
    }
}


class ViagemImpar<Element>: MyIterator {
    
    var collection: Locais<Element>
    var index: Int = -1
    
    init(_ collection: Locais<Element>) {
        self.collection = collection
    }
    
    
    func hasMore() -> Bool {
        
        defer { self.index += 2 }
        if index + 2 < self.collection.items.count {
            return true
        }
        return false
    }
}


class ViagemLinear<Element>: MyIterator {
    
    var collection: Locais<Element>
    var index: Int = -1
    
    init(_ collection: Locais<Element>) {
        self.collection = collection
    }
    
    func hasMore() -> Bool {
        defer { self.index += 1 }
        if index + 1 < self.collection.items.count {
            return true
        }
        return false
    }
}


class ViagemLinearInvertida<Element>: MyIterator {
    
    var collection: Locais<Element>
    var index: Int
    
    
    init(_ collection: Locais<Element>) {
        self.collection = collection
        self.index = collection.items.count
    }
    
    func hasMore() -> Bool {
        defer { self.index -= 1 }
        if index > 0 {
            return true
        }
        return false
    }
}


class Locais<Element> {
    
    var items: [Element]
    
    init(_ items: [Element]) {
        self.items = items
    }
}


//MARK: - Testing
let locais = Locais([0, 1, 2, 3])
let viagemPar = ViagemPar<Int>(locais)
let viagemImpar = ViagemImpar<Int>(locais)
let viagemLinear = ViagemLinear<Int>(locais)
let viagemInvertida = ViagemLinearInvertida<Int>(locais)


print("Viagem Par:")
while let local = viagemPar.next() {
    print(local)
}

print("\nViagem Impar:")
while let local = viagemImpar.next() {
    print(local)
}

print("\nViagem Linear:")
while let local = viagemLinear.next() {
    print(local)
}

print("\nViagem Invertida:")
while let local = viagemInvertida.next() {
    print(local)
}
//: [Next](@next)

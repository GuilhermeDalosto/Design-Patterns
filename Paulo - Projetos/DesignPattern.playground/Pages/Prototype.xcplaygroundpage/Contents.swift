/*:
[Previous](@previous)

# Prototype
 - - -
 ![Prototype Diagram](Prototype_diagram.png)
 ![Prototype Diagram2](Prototype_diagram2.png)
 
 É um *creational design pattern* que nos permite clonar objetos existentes, sem que o código seja dependente de sua classe, em geral, o conceito é **copiar um objeto existente em vez de criar uma instância do zero**.
 
 Podemos adicionar na estrutura um Prototype Registry, que nos fornece uma maneira fácil de acessar protótipos usados ​​com frequência. Ele armazena um conjunto de objetos (prototypes) que estão prontos para serem copiados. O registro de protótipo mais simples é um hash map de name:prototype. No entanto, se precisarmos de melhores critérios de pesquisa do que um simples nome, poderíamos criar uma versão muito mais robusta de registro.

 ## Code Example
*/
import XCTest

/// Swift has built-in cloning support. To add cloning support to your class,
/// you need to implement the NSCopying protocol in that class and provide the
/// implementation for the `copy` method.
class BaseClass: NSCopying, Equatable {

    private var intValue = 1
    private var stringValue = "Value"

    required init(intValue: Int = 1, stringValue: String = "Value") {

        self.intValue = intValue
        self.stringValue = stringValue
    }

    /// MARK: - NSCopying
    func copy(with zone: NSZone? = nil) -> Any {
        let prototype = type(of: self).init()
        prototype.intValue = intValue
        prototype.stringValue = stringValue
        print("Values defined in BaseClass have been cloned!")
        return prototype
    }

    /// MARK: - Equatable
    static func == (lhs: BaseClass, rhs: BaseClass) -> Bool {
        return lhs.intValue == rhs.intValue && lhs.stringValue == rhs.stringValue
    }
}

/// Subclasses can override the base `copy` method to copy their own data into
/// the resulting object. But you should always call the base method first.
class SubClass: BaseClass {

    private var boolValue = true

    func copy() -> Any {
        return copy(with: nil)
    }

    override func copy(with zone: NSZone?) -> Any {
        guard let prototype = super.copy(with: zone) as? SubClass else {
            return SubClass() // oops
        }
        prototype.boolValue = boolValue
        print("Values defined in SubClass have been cloned!")
        return prototype
    }
}

/// The client code.
class Client {
    // ...
    static func someClientCode() {
        let original = SubClass(intValue: 2, stringValue: "Value2")

        guard let copy = original.copy() as? SubClass else {
            XCTAssert(false)
            return
        }

        /// See implementation of `Equatable` protocol for more details.
        XCTAssert(copy == original)

        print("The original object is equal to the copied object!")
    }
    // ...
}


Client.someClientCode()
//: [Next](@next)

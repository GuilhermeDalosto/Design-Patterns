/*:
 [Previous](@previous)
 
 # Command
 ---
 ![](Command_diagram.png)
 - - -
 ![](Command_diagram2.png)
 ![](Command_diagram3.png)
 
 É um *behavioral design pattern* que transforma um *request* em um objeto independente que contêm toda a informação a respeito do request.
 Design de software é baseado no princípio de separação de interesses, o que resulta em decompor o app em camadas. Essas camadas são, geralmente, gráficas e a lógica de negócio. Geralmente no código funciona assim: a camada gráfica chama um método da camada lógica, passando alguns argumentos, esse processo chamamos de request.
 
 Esse padrão sugere que os objetos da camada gráfica não façam os requests diretamente, em vez disso, extraímos todos os detalhes do request - objeto sendo chamado, nome do método lógico, lista de argumentos passados, etc. - e colocamos em uma classe Command.
 Dessa maneira, elementos - botões, menus, atalhos, etc. - que dependem da mesma operação - método da camada lógica - serão linkados para o mesmo command, evitando códigos duplicados - já que de outra maneira, faríamos subclasses desses botões e menus.
 
 */

// MARK: - Exemplo 1
import Foundation

// MARK: - Receiver
public class Door {
    public var isOpen = false
}


// MARK: - Command
// É desejada que essa classe seja abstrata,
// iremos instanciar e usar suas subclasses.
public class DoorCommand {
    
    public let door: Door
    
    public init(_ door: Door) {
        self.door = door
    }
    
    
    public func execute() { }
}


public class OpenCommand: DoorCommand {
    
    public override func execute() {
        print("opening the door...")
        door.isOpen = true
    }
}


public class CloseCommand: DoorCommand {
    
    public override func execute() {
        print("closing the door...")
        door.isOpen = false
    }
}


// MARK: - Invoker
public class Doorman {
    
    public let commands: [DoorCommand]
    public let door: Door
    
    public init(door: Door) {
        let commandCount = arc4random_uniform(10) + 1
        self.commands = (0 ..< commandCount).map { index in
            return index % 2 == 0 ?
                OpenCommand(door) : CloseCommand(door)
        }
        self.door = door
    }
    
    
    public func execute() {
        print("Doorman is...")
        commands.forEach { $0.execute() }
    }
}


public let isOpen = true
print("You predict the door will be " +
    "\(isOpen ? "open" : "closed").")
print("")

let door = Door()
let doorman = Doorman(door: door)
doorman.execute()
print("")

/*:
 - - -
 */
// Exemplo 2
import XCTest

/// The Command interface declares a method for executing a command.
protocol Command {
    
    func execute()
}


/// Some commands can implement simple operations on their own.
class SimpleCommand: Command {
    
    private var payload: String
    
    init(_ payload: String) {
        self.payload = payload
    }
    
    func execute() {
        print("SimpleCommand: See, I can do simple things like printing (" + payload + ")")
    }
}

/// However, some commands can delegate more complex operations to other
/// objects, called "receivers."
class ComplexCommand: Command {
    
    private var receiver: Receiver
    
    /// Context data, required for launching the receiver's methods.
    private var a: String
    private var b: String
    
    /// Complex commands can accept one or several receiver objects along with
    /// any context data via the constructor.
    init(_ receiver: Receiver, _ a: String, _ b: String) {
        self.receiver = receiver
        self.a = a
        self.b = b
    }
    
    /// Commands can delegate to any methods of a receiver.
    func execute() {
        print("ComplexCommand: Complex stuff should be done by a receiver object.\n")
        receiver.doSomething(a)
        receiver.doSomethingElse(b)
    }
}

/// The Receiver class contain some important business logic. They know how to
/// perform all kinds of operations, associated with carrying out a request. In
/// fact, any class may serve as a Receiver.
class Receiver {
    
    func doSomething(_ a: String) {
        print("Receiver: Working on (" + a + ")\n")
    }
    
    func doSomethingElse(_ b: String) {
        print("Receiver: Also working on (" + b + ")\n")
    }
}

/// The Invoker is associated with one or several commands. It sends a request
/// to the command.
class Invoker {
    
    private var onStart: Command?
    
    private var onFinish: Command?
    
    /// Initialize commands.
    func setOnStart(_ command: Command) {
        onStart = command
    }
    
    func setOnFinish(_ command: Command) {
        onFinish = command
    }
    
    /// The Invoker does not depend on concrete command or receiver classes. The
    /// Invoker passes a request to a receiver indirectly, by executing a
    /// command.
    func doSomethingImportant() {
        
        print("Invoker: Does anybody want something done before I begin?")
        
        onStart?.execute()
        
        print("Invoker: ...doing something really important...")
        print("Invoker: Does anybody want something done after I finish?")
        
        onFinish?.execute()
    }
}

/// Let's see how it all comes together.
/// The client code can parameterize an invoker with any commands.

let invoker = Invoker()
invoker.setOnStart(SimpleCommand("Say Hi!"))

let receiver = Receiver()
invoker.setOnFinish(ComplexCommand(receiver, "Send email", "Save report"))
invoker.doSomethingImportant()

//: [Next](@next)

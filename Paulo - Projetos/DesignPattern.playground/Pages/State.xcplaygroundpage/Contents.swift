/*:
 [Previous](@previous)
 
 # State
 - - -
 ![State Diagram](State_diagram.png)
 ![State Diagram2](State_diagram2.png)
 
 É um behavioral design pattern que permite que objetos alterem seu comportamento quando seu estado (state) interno muda. É como se o objeto tivesse sua classe alterada.
 Essa estrutura pode parecer semelhante ao Strategy, mas há uma diferença importante. No State, os estados específicos podem estar cientes um do outro e iniciar transições de um para outro, enquanto as strategies quase nunca se conhecem.
 
 ## Code Example
*/
import Foundation
import XCTest

/// The Context defines the interface of interest to clients. It also maintains
/// a reference to an instance of a State subclass, which represents the current
/// state of the Context.
class Context {

    /// A reference to the current state of the Context.
    private var state: State

    init(_ state: State) {
        self.state = state
        transitionTo(state: state)
    }

    /// The Context allows changing the State object at runtime.
    func transitionTo(state: State) {
        print("Context: Transition to " + String(describing: state))
        self.state = state
        self.state.update(context: self)
    }

    /// The Context delegates part of its behavior to the current State object.
    func request1() {
        state.handle1()
    }

    func request2() {
        state.handle2()
    }
}

/// The base State class declares methods that all Concrete State should
/// implement and also provides a backreference to the Context object,
/// associated with the State. This backreference can be used by States to
/// transition the Context to another State.
protocol State: class {

    func update(context: Context)

    func handle1()
    func handle2()
}

class BaseState: State {
    // States podem armazenar uma referência do contexto. Através dessa
    // refrência, o state pode carregar qualquer informação do contexto,
    // como iniciar transições de states.
    private(set) weak var context: Context?

    func update(context: Context) {
        self.context = context
    }

    func handle1() {}
    func handle2() {}
}

/// Concrete States implement various behaviors, associated with a state of the
/// Context.
class ConcreteStateA: BaseState {

    override func handle1() {
        print("ConcreteStateA handles request1.")
        print("ConcreteStateA wants to change the state of the context.\n")
        context?.transitionTo(state: ConcreteStateB())
    }

    override func handle2() {
        print("ConcreteStateA handles request2.\n")
    }
}

class ConcreteStateB: BaseState {

    override func handle1() {
        print("ConcreteStateB handles request1.\n")
    }

    override func handle2() {
        print("ConcreteStateB handles request2.")
        print("ConcreteStateB wants to change the state of the context.\n")
        context?.transitionTo(state: ConcreteStateA())
    }
}


let context = Context(ConcreteStateA())
context.request1()
context.request2()

//: [Next](@next)

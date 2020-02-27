import UIKit

//State Pattern é um Padrão que permite que um objeto mude de "estado" em tempo de execução, estado refere a um conjuto de dados que defino como o objeto deve se comportar. State Pattern é bem similar ao strategy, mas com uma diferença chave, que  cada estado sabe o próximo e o estado anterios, diferente do strategy onde esses detalhers ficam isloados.


// aqui criamos o state protocol, é o substituto da classe base

protocol PackageStateProtocol{
    
    func prevState() -> Void
    func nextState() -> Void
    func printStatus() -> Void
    func changeState() -> PackageStateProtocol?
}
extension PackageStateProtocol{
    func changeState() -> PackageStateProtocol?{
        return nil
    }
}


// aqui definimos os vários possiveis estados
public class OrderedState: PackageStateProtocol{
    func changeState() -> PackageStateProtocol?{
        self.prevState()
        self.nextState()
        print("________________")
        return DeliveredState()
    }
    
    func prevState() {
        print("this is the Initial State")
    }
    
    func nextState() {
        print("Next step is to be delivered")
    }
    
    func printStatus() {
        print("The current state is Ordered (:")
    }
    
    
    
    
}

public class DeliveredState: PackageStateProtocol{
    func changeState() -> PackageStateProtocol? {
        self.prevState()
        self.nextState()
        print("________________")
        return ReceivedState()
    }
    
    func prevState() {
        print("the last step was be ordered")
    }
    
    func nextState() {
        print("Next step is to be Received by the buyer")
    }
    
    func printStatus() {
        print("The current state is in Delivery (:")
    }
    
    
    
    
}

public class ReceivedState: PackageStateProtocol{
    func changeState() -> PackageStateProtocol? {
        print("steps was completed")
        return OrderedState()
    }
    
    func prevState() {
         print("the last step was be in delivery")
    }
    
    func nextState() {
        print("The order is completed")
    }
    
    func printStatus() {
         print("Received XD")
    }
    
    
    
}

// aqui é o context, o objeto que muda de estado
public class Packege: PackageStateProtocol{
    
    
   
    var state: PackageStateProtocol? = nil{
        didSet{
            printStatus()
        }
    }
    
    init() {
        print("Pacote inicializou")
    }
    
    func prevState() {
        state?.prevState()
    }
    
    func nextState() {
        state?.nextState()
    }
    
    func printStatus() {
        state?.printStatus()
    }
    
    func setState(){
        self.state = state?.changeState()
    }
}



let packge = Packege()
packge.state = OrderedState()
packge.setState()
packge.setState()

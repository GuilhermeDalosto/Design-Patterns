import UIKit
import Combine





public class ContaCorrente{
    
    //declarando essa váriavel com a anotation Published digo pro xcode criar um publisher para essa property
    //Publisher não pode ser criado em nenhum outro tipo além de classes e a property deve ser var
    
    @Published var saldo: CGFloat
    
    init(saldo: CGFloat) {
        self.saldo = saldo
    }
    
    
}


let conta1 = ContaCorrente(saldo: 100)

//aqui acessamos o publisher e dizemos para ele notificar qualquer mudança no saldo, isso retorna um objeto do tipo Published<String>, esse objeto é onde verificamos as alterações.
let publisher = conta1.$saldo


// aqui criamos um subscriber que receberar os notificações do publisher que criamos, por padrão o método sink retorna um objeto do tipo AnyCancellable, pora deixamos explicitos como AnyCancellable? para caso queremos cancelar o subscriber dps

var subscriber: AnyCancellable? = publisher.sink { (newNum) in
    print("o Novo saldo é \(newNum)")
}

conta1.saldo = 250
subscriber = nil
conta1.saldo = 300








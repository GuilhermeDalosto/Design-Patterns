import UIKit

//O Strategy é um design patterns para mudarmos o comportamento de um objeto em tempo de execucao.
// Se uma mesma class faz a msm coisa de diferentes maneiras, extraimos essa lógica para classas separadas chamas strategy e a classe prinicipal (context) não precisará saber de nenhum detalhe sobre a lógica, eles se comunicarão através de uma interface comun

public struct Cidades: OptionSet{
    public let rawValue: Int
    static let brazlandia = Cidades(rawValue: 1 << 0)
    static let taguatinga = Cidades(rawValue: 1 << 1)
    static let ceilandia = Cidades(rawValue: 1 << 2)
    static let aguasClaras = Cidades(rawValue: 1 << 3)
    static let guara = Cidades(rawValue: 1 << 4)
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
        
    }
}


public protocol Strategy{
    
    func createRoute(from: Cidades, to: Cidades) -> Cidades
}


public class ByCarStrategy: Strategy{
    
    public func createRoute(from: Cidades, to: Cidades) -> Cidades {
        var rota: Cidades = [from,to]
        print("Vai demorar cerca de 20 minutos")
        rota.insert(.taguatinga)
        return rota
    }
    
    
}

public class ByWalkingStrategy: Strategy{
    let cidades: Cidades = [.aguasClaras,.brazlandia,.ceilandia,.guara,.taguatinga]
    public func createRoute(from: Cidades, to: Cidades) -> Cidades {
        let rota: Cidades = [from,to]
        print("40 minutos no min")
        return cidades.subtracting(rota)
    }
    
}

public class ByPublicTransportStrategy: Strategy{
    
    public func createRoute(from: Cidades, to: Cidades) -> Cidades {
        var rota: Cidades = [from,to]
        print("1 hora e meia no min")
        if from == .brazlandia{
            rota.insert(.ceilandia)
            return rota
        }
        
        return rota
    }
    
    
}
//OBS: AS LÓGICAS DOS MEIOS DE TRANSPORTE NÃO FAZ SENTIDO, SÓ EXEMPLO.
//as tres class concretas assima, implementa o protocol Strategy e tem sua propria logica para fazer a mesma coisa, são as classes strategy.


// esse é o contexto, a class principal que ultiliza as estrategias
public class MapContext{
    
    private(set) var delegateStrategy: Strategy? = nil
    
    
    func setStrategy(_ strategy: Strategy?){
        self.delegateStrategy = strategy
    }
    
    func createRoute(from: Cidades, to: Cidades){
        delegateStrategy?.createRoute(from: from, to: to)
    }
}


// aqui temos o cliente que fica responsavel por determina qual sera a estratégia para o contexto
let context = MapContext()
let walking = ByWalkingStrategy()

context.setStrategy(walking)

context.createRoute(from: .brazlandia, to: .aguasClaras)

let car = ByPublicTransportStrategy()
context.setStrategy(car)
context.createRoute(from: .ceilandia, to: .guara)

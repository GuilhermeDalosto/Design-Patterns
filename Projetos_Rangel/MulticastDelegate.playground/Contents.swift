import UIKit

/*:
 ![multCastDelegate](delegate.png)
 */


// Multicast delegate é um padrão de projeto comportamental derivado do delegate onde permite você criar um relacionamento de 1-n delegates, esse padrão involve 4 tipos:
//Objeto principal precisando ser delegado
//Delegate protocol com os métodos de devem ser implementados
//Delegates: Objetos que implementam o protocolo
//Multicast delegate helper que tem uma refêrencia para todos os delegates e notifica  quando eventos devem acontecer.

// Geralmente usamos esse padrão para informar vários objetos sobre alguma mudaça no objeto principal
//Obs: Caso queiramos passar dados, não é recomendado usar esse design patters pois pode acontecer de dados duplicados no meio do caminho, ou processamento desperdiçado
            

// aqui criamos um Multicast delegate helper, usamos <ProtocolType> assim nossa classa fica genérica.
public class MulticastDelegateHelper<ProtocolType>{
    
    
    //wrapper
    //Desse forma o MulticastDelegateHelper tem uma refência forte para o wrapper e o wrapper
    private class DelegateWrapper{
        
        weak var delegate: AnyObject?
        
        init(_ delegate: AnyObject) {
            self.delegate = delegate
        }
    }
    
    private var delegateWrappers: [DelegateWrapper]
    
    public var delegates: [ProtocolType]{
        delegateWrappers = delegateWrappers.filter{$0.delegate != nil}
        return delegateWrappers.map{ $0.delegate! } as![ProtocolType]
    }
    
    init(_ delegates: [ProtocolType] = []) {
        delegateWrappers = delegates.map{DelegateWrapper($0 as AnyObject)}
    }
    
    
    public func addDelegate(_ delegate: ProtocolType){
        let wrapper = DelegateWrapper(delegate as AnyObject)
        self.delegateWrappers.append(wrapper)
    }
    
    public func removeDelegate(_ delegate: ProtocolType){
        guard let index = delegateWrappers.firstIndex(where: {$0.delegate === (delegate as AnyObject)}) else{
            return
        }
        delegateWrappers.remove(at: index)
    }
    
    func invokeAction(_ closure: (ProtocolType) -> ()){
        delegates.forEach{closure($0)}
    }
}

import UIKit
import Foundation

/*:
 ![adapter](adapter.png)
*/


//Adapter (também conhecido como wrapper) é um design patter estrutual que busca conectar objetos com interfaces incompativéis com outra objeto.

//Com o adpter uma interface compatível com um dos objetos existentes.
//Usando essa interface um dos objetos pode chamar os métodos de forma segura
//Quando o adpter recebe uma requisição, ele retorna essa requisição no formado que o objeto espera


// temos o cliente: que uma classe já existente contendo uma lógica já pronta
// o protocolo que outras classes devem seguir para se comunicar com o cliente
//Service, geralmente algum objeto de terceiro que não temos acesso direto
// adpater: classe que ira implementar o protocolo para fazer a comunicação entre o cliente e service




protocol Rounded{
    
    var radious: CGFloat {get set}
    
    
    func getRadious() -> CGFloat
    
    
}


public class RoundPeg: Rounded{
   
    internal var radious: CGFloat
    
    init(radious: CGFloat){
        self.radious = radious
        
    }
    
    func getRadious() -> CGFloat {
        return self.radious
    }
    
}


public class RoundHole: Rounded{
   
    internal var radious: CGFloat
    
    init(radious: CGFloat){
        self.radious = radious
        
    }
    
    func getRadious() -> CGFloat {
        return self.radious
    }
    
    func fits(peg: RoundPeg) -> Bool{
        return peg.getRadious() <= self.getRadious()
    }
    
    
}

public class SquarePeg{
    
    private var width: CGFloat
    
    init(width: CGFloat) {
        self.width = width
    }
    
    func getWidth() -> CGFloat{
        return self.width
    }
}
 

public class SquarePegAdapter: RoundPeg{
        
        private var peg: SquarePeg
        
        init(peg: SquarePeg) {
            var dois: CGFloat = 2.0
            dois =  peg.getWidth() * dois.squareRoot() / 2.0
            self.peg = peg
            super.init(radious:dois)
        }
    
}




let hole = RoundHole(radious: 30)
let roudedPeg = RoundPeg(radious: 25)

let square = SquarePeg(width: 20)


let squareAdapted = SquarePegAdapter(peg: square)
print(hole.fits(peg: roudedPeg))

// desse jeito não funciona, pois roudedholes só aceita roudedPegs
//print(hole.fits(peg: square))


print(hole.fits(peg: squareAdapted))






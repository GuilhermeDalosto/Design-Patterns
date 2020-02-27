import UIKit


/*:
 ![Factory schema](Factory.png)
 */


//Factory Method é um design pattern criational que provê uma interface para a criação de objetos em uma superclasse. Porém, permite que subclasses  mude o tipo do objeto que vai ser criado.
//O Factory sugere que substituimos a criação de objetos diretamente pelo cliente, mudando a lógica de construção para uma classe ConstructionFactory, nessa classe teriamos um método de create que retornaria um "produto" (a interface para crianção de produtos. Usando esse pattern, o cliente, quem usa esse ConstructionFactory não ver diferença nos tipo de produto retornado, para ele só importa que seja um produto que eles tenha o mesmo comportamento

//1. Uma interface que seja comun a todos os produtos que pode ser criado pelos ConstructionFactory
//2. Produtos Concretos são váriações do Produto interface
//3. Creator classe, geralmente se declara uma super class com métodos abstrados e com o método de criação que retorne o produto. O importante lembrar que apesar do nome, sua principal função não é criar objetos, e definir algumas lógicas, tirando toda aresponsabilidade das classes de Produto Contreto.
//4. ConcreteCreator override os métos da super classe creator.

//Geralmente usa-se esse padrão quando não temos certeza qual tipo de objeto será usado. O Factory tem o objetivo de entregar o produto final pro cliente escodendo alguns detalhes de lógiica e criação, pois podemos fácilmente adicionar novas váriações de produto apenas modificando o método de creation no Factory.

public enum ProductType{
    case perishable
    case nonPerishable
}

// Aqui temos a interface para comun a criação de produtos
protocol Transport{
    
    func delivery() -> Void
}

// Váriação de produtos concretos
public class Truck: Transport{
    var msg: String
    init(msg: String) {
        self.msg = msg
    }
    func delivery() {
        print(msg)
    }
}


public class Ship: Transport{
    var msg: String
    init(msg: String) {
       self.msg = msg
    }
    func delivery() {
        print(msg)
    }
}

// Aqui temos a interface comun a  criação de Factory Classes, tbm poderia ser uma superClasse
protocol Logistic{
   
    func createTransport() -> Transport
}


//Aqui temos váriação de Factories concretos
public class RoadLogistic: Logistic{
    
    let msg: String
    init(type: ProductType) {
       if type == .perishable{
        self.msg = "Camnhão de alta velocidade"
       }else{
          self.msg = "Camnhão de velocidade normal"
       }
   
    }
        
    func createTransport() -> Transport {
        return Truck(msg: self.msg)
    }
    
    
}


public class SeaLogistic: Logistic{
    
    let msg: String
    init(type: ProductType) {
       if type == .perishable{
        self.msg = "Lancha de alta velocidade"
       }else{
          self.msg = "Lancha de velocidade normal"
       }
   
    }
        
    func createTransport() -> Transport {
        return Ship(msg: self.msg)
    }
    
    
}

// Aqui o cliente usando o factory ideal para vada situação

let seaFactor = SeaLogistic(type: .nonPerishable)

let product1 = seaFactor.createTransport()

product1.delivery()

let roadFactor = RoadLogistic(type: .perishable)

let product2 = roadFactor.createTransport()

product2.delivery()

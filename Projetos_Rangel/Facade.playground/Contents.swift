import UIKit


/*:
 ![Facade](facade.png)
 */

//Facade é um design pattern estrutural que visa prover uma interface simplificada para algum subsistema com um conjunto de subclasses.
// Coordernar o acesso direto ao um sub sistemas que depende de diversas classes para seu funcionamente pode ser uma tarefa complexa e nada manutenível. Com o facade criamos uma classe onde iremos abstrair apenas as funcionalidades necessárias para o cliente, assim o cliente não precisa ter acesso direto a todas essas classes. Case queiramos abstrair mais podemos criar aditional facades para auxiliar nesse processo.

// Geralmente usamos facado quando temos uma interface complicada para uma subsistema

//Seja cuidadoso ao criar um facade“ deus ” que conheça todas as classes do seu aplicativo.
//Não há problema em criar mais de uma facade para diferentes casos de uso. Por exemplo, se você notar que uma facade possui funcionalidade que algumas classes usam e outras que outras classes usam, considere dividi-la em dois ou mais facades


public class Carne{
    func createCarne(){
        print("criando carne")
    }
}
public class Pao{
    func createPao(){
        print("criando Pao")
    }
}
public class Salada{
    func createSalada(){
        print("criando Salada")
    }
}
public class Queijo{
    func createQueijo(){
        print("criando Queijo")
    }
}


public class FacadeBurger{
    
    private let carne = Carne()
    private let pao = Pao()
    private let salada = Salada()
    private let queijo = Queijo()
    
    func createHamburguer() {
        carne.createCarne()
        pao.createPao()
        queijo.createQueijo()
        salada.createSalada()
    }
    
}


let facadeBurger = FacadeBurger()


facadeBurger.createHamburguer()

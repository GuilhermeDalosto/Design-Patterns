import UIKit

/*:
 ![Command](command.png)
 */
//Command  é design patterns comportamental que encapsula requests de objeto para outro em um novo "Command Objeto", dessa forma o sender( quem invaca a requisição) não tem acesso direto ao Reciver (quem é responsável por executar esse requisição). Essa maneira permite parametrizar métodos com diferentes solicitções, atrasar ou enfileirar a execução de uma solicitação.
//Essse pattern é composto pelas seguintes entidades.

//Sender: é responsável por iniciar solicitações. Essa classe deve ter um campo para armazenar uma referência a um objeto Command. O remetente aciona esse comando, em vez de enviar a solicitação diretamente ao destinatário. O sender não é responsável por criar o objeto Command. Geralmente, esse ele recebe esse command já criado através do contrutos
//Uma interface comum para criação de commands, geralmente com um único método de execução.
//Commands Concretos: implementa as diferentes solicitações. Ele não é responsável por executar o trabalho e sim passar para o reciver. Porém, pode haver excessões. Caso o método precise de parâmetros, eles ficaram armazenados nessa classe.
//Receiver:  contém a lógica de negócios para resolver a solicitação.
//Cliente: cria e configura objetos commands. O cliente deve passar todos os parâmetros de solicitação, incluindo uma instância do resender, para o construtor do command. Depois disso, o comando resultante pode ser associado a um ou vários remetentes.


//Gealmente se ussa esse padrão quando desejamos enfileirar operações, agendar sua execuçãos, executá-las remotamente ou fazer ações reversíveis. Também é útil quando queremos parametrizar objetos com operações.

//É útil para montar um conjunto de comandos simples em um comando complexo.Porém, o código pode se tornar mais complicado, pois você está introduzindo uma nova camada entre senders e receivers.

public class Door{
    public var isOpen = false
}


protocol DoorCommand{
    
    var door: Door {get}
    
    init(_ door: Door)
    
    func executeCommand()->Void
}


public class OpenDoor: DoorCommand{
    var door: Door
    
    required init(_ door: Door) {
        self.door = door
    }
    
    func executeCommand() {
        print("door is opened")
        self.door.isOpen = true
    }
}

public class CloseDoor: DoorCommand{
    var door: Door
    
    required init(_ door: Door) {
        self.door = door
    }
    
    func executeCommand() {
        print("door is closed")
        self.door.isOpen = false
    }
}


public class GUI{
    
    private var commands = [DoorCommand]()
    private var door: Door
    
    init(_ door: Door) {
        self.door = door
    }
    
    
    public func openDoorButton(){
        commands.append(OpenDoor(door))
        commands.forEach { $0.executeCommand() }
        commands.removeAll()
    }
    public func closeDoorButton(){
        commands.append(CloseDoor(door))
        commands.forEach { $0.executeCommand() }
        commands.removeAll()

    }
}


let door = Door()

let gui = GUI(door)


gui.closeDoorButton()
gui.openDoorButton()
gui.closeDoorButton()



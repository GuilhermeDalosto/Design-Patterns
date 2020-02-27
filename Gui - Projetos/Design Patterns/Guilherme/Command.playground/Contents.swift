import Foundation

public class Door{
    public var isOpen = false
}


public class DoorCommand{
    public let door: Door
    
    public init(_ door: Door){
        self.door = door
    }
    
    public func execute() {}
}


public class OpenCommand: DoorCommand{
    public override func execute(){
        print("opening the door...")
        door.isOpen = true
    }
}

public class CloseCommand: DoorCommand{
    public override func execute(){
        print("closing the door...")
        door.isOpen = false
    }
}

public class DoorMan{
    public let commands: [DoorCommand]
    public let door: Door
    
    // 3
    public init(door: Door) {
        let commandCount = arc4random_uniform(10) + 1
        self.commands = (0 ..< commandCount).map { index in
            return index % 2 == 0 ?
                OpenCommand(door) : CloseCommand(door)
        }
        self.door = door
    }
    
    // 4
    public func execute() {
        print("Doorman is...")
        commands.forEach { $0.execute() }
    }
}

let door = Door()
let doorman = DoorMan(door: door)
doorman.execute()

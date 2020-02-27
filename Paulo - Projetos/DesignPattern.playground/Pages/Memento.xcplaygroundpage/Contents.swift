/*:
[Previous](@previous)

# Memento
- - - - - - - - - -
![Memento Diagram](Memento_Diagram.png)

The memento pattern allows an object to be saved and restored. It involves three parts:

(1) The **originator** is the object to be saved or restored.

(2) The **memento** is a stored state.

(3) The **caretaker** requests a save from the originator, and it receives a memento in response. The care taker is responsible for persisting the memento, so later on, the care taker can provide the memento back to the originator to request the originator restore its state.

## Code Example
*/
import Foundation


typealias Memento = [String:Int]


protocol MementoProtocol {
    var memento: Memento { get }
    init?(memento: Memento)
}


// MARK: - Originator e Memento
public final class Game: Codable, MementoProtocol {

    private enum mementoKeys {
        static let attemptsRemaining = "attemptsRemaining"
        static let level = "level"
        static let score = "score"
    }
    
    private(set) var attemptsRemaining: Int
    private(set) var level: Int
    private(set) var score: Int
    
    
    init() {
        self.attemptsRemaining = 3
        self.level = 1
        self.score = 0
    }
    
    
    init(memento: Memento) {
        guard let attempts = memento[mementoKeys.attemptsRemaining], let level = memento[mementoKeys.level], let score = memento[mementoKeys.score] else {
            self.attemptsRemaining = 3
            self.level = 1
            self.score = 0
            return
        }
        
        self.attemptsRemaining = attempts
        self.level = level
        self.score = score
    }
    
    
    var memento: Memento {
        return [mementoKeys.attemptsRemaining : attemptsRemaining, mementoKeys.level : level, mementoKeys.score : score]
    }
    
    
    public func setScore(value: Int) {
        self.score += value
    }
    
    
    public func decreaseAttempts() {
        self.attemptsRemaining -= 1
    }
    
    
//    public func save() -> Memento {
//        return Game.MementoState()
//    }
}


// MARK: - CareTaker
public class GameSystem {

    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    private let userDefaults = UserDefaults.standard

    func save(_ game: Game, title: String) throws {
        let data = try encoder.encode(game.memento)
        userDefaults.set(data, forKey: title)
    }
    
    
    func load(title: String) -> Memento {
        guard let data = userDefaults.data(forKey: title), let mementoState = try? decoder.decode(Memento.self, from: data) else { return Game().memento }
        return mementoState
    }
}

// MARK: - Example
var game = Game()
game.decreaseAttempts()
game.setScore(value: 9008)

// Save Game
let gameSystem = GameSystem()
try gameSystem.save(game, title: "Best Game Ever")

// Load game
game = Game(memento: gameSystem.load(title: "Best Game Ever"))
print("Loaded Game Score: \(game.score)")


/*:
 ![Memento Diagram2](Memento_Diagram2.png)
 
 Podemos usar essa implementação quando não queremos que nenhuma classe tenha qualquer acesso aos dados do originator através do memento.
 
 [Next](@next) */

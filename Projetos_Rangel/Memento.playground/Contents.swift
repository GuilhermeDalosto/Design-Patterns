import UIKit
/*:
![momento](memento.png)
*/



//Memento é um design parttern comportamental que permite você salvar e restaurar o último estado do objeto.
// Esse design pattern possuí 3 entidades principais, são elas7.26.46.png")
//Originator: O objeto em sí que será salvo
//Memento: que é um objeto que representa o estado do objeto que será salvo.
//CareTaker: O objeto responsável por requisitar salvar e recuperar o estado do objeto. Esse objeto pode se comunica com o memento através uma interface.

//OBS: Nesse design pattern a classe memento é criada dentro do objeto, assim originator pode acessar todos os métodos e properties do memento, mesmo que eles sejam privados.
//Geralmente usamos o memento quando queremos salvar o estado de um objeto e recuperar dps, por exemplo um editor de texto q queremos da um "UNDO."

public class Editor: Codable{
    
    public var text: String = ""
    public var curX: CGFloat = 0.0
    public var curY: CGFloat = 0.0
    public var selectionWidth: Int = 0
    
    
    
    
    public class State: Codable{
        public var editor: Editor!
        public var text: String = ""
        public var curX: CGFloat = 0.0
        public var curY: CGFloat = 0.0
        public var selectionWidth: Int = 0
        
        init() {}
        
        func restore(){
            editor.state = self
        }
    }
    
    public var state: State{
        didSet{
            self.text = state.text
            self.curX = state.curX
            self.curY = state.curY
            self.selectionWidth = state.selectionWidth
        }
    }
    
    init() {
        self.state = State()
        self.state.editor = self
    }
    
    func setText(text: String){
        state.text += text
    }
    func setCursor(x: CGFloat, y:CGFloat){
        state.curX = x
        state.curY = y
    }
    func setSelectionWidth(width: Int){
        state.selectionWidth = width
    }
    
    func createSnapshot() -> State{
        return self.state
    }
    
    func printInfo(){
        print("Text: \(self.text)")
        print("Cursor: X:\(self.curX)  Y:\(self.curY)")
        print("SelectionWitdh: \(self.selectionWidth)")
    }

}

// MARK: - CareTaker
public class System {

  // 1
  private let decoder = JSONDecoder()
  private let encoder = JSONEncoder()
  private let userDefaults = UserDefaults.standard

  // 2
  public func save(_ editor: Editor, title: String) throws {
    let data = try encoder.encode(editor)
    userDefaults.set(data, forKey: title)
  }

  // 3
  public func load(title: String) throws{
    guard let data = userDefaults.data(forKey: title),
      let editor = try? decoder.decode(Editor.self, from: data)
      else {
      throw Error.snapShotNotFound
    }
    editor.state.restore()
  }

  public enum Error: String, Swift.Error {
    case snapShotNotFound
  }
}


let system = System()

let editor = Editor()

try? system.save(editor, title: "beckuo1")
editor.setText(text: "Hello world")
editor.setCursor(x: 50, y: 200)
editor.selectionWidth = 5
editor.printInfo()

try? system.load(title: "beckuo1")

editor.printInfo()

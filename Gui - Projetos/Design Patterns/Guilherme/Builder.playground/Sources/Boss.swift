import Foundation

public class Boss {
     public var name : String { get{return name}  set {name = newValue} }
     var level : Int? { get{return level}  set {level = newValue} }
    
     var hp : Int? { get{return hp}  set {hp = newValue} }
     var mp : Int? { get{return mp}  set {mp = newValue} }
    
     var  age : Int? { get{return age}  set {age = newValue} }
     var height : Float? { get{return height}  set {height = newValue} }
    
    public init(){
        
    }
    
}

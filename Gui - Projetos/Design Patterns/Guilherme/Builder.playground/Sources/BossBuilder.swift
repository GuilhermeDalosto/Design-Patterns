import Foundation

public class BossBuilder{
    
    public  var name : String?
    public  var level : Int?
    
    public  var hp : Int?
    public  var mp : Int?
    
    public  var age : Int?
    public  var height : Float?
    
    public init() {
        
    }
    
    public func setStatistics(name: String,level: Int){
        self.name = name
        self.level = level
    }
    
    public func setAttributes(hp: Int,mp: Int){
        self.hp = hp
        self.mp = mp
    }
    
    public func setStructure(age: Int,height: Float){
        self.age = age
        self.height = height
    }
    
    public func build() -> Boss{
        var aux = Boss()
        aux.name = self.name!
        aux.level = self.level!
        aux.hp = self.hp!
        aux.mp = self.mp!
        aux.age = self.age!
        aux.height = self.height!
        return aux
        
    }
    
    
    
    
    
    
    
    
}

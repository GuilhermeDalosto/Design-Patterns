import UIKit


//Aqui é um exemplo do BUilder para criar um macarrão, que pode ser feito de várias formas diferentes, com diferentes components



// aqui criamos os tipos que podem compor um macarra, sendo os molhos e carnes opicionais
public enum Massa: String {
  case talharim
  case concha
  case fino
}

public struct Molhos : OptionSet {
   public let rawValue: Int
   public static let branco = Molhos(rawValue: 1 << 0)
   public static let maionese = Molhos(rawValue: 1 << 1)
   public static let deTomate = Molhos(rawValue: 1 << 2)
   public static let quatroQueijo = Molhos(rawValue: 1 << 3)
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

public struct Carnes : OptionSet {
   public let rawValue: Int
   public static let bife = Carnes(rawValue: 1 << 0)
   public static let peitoDeFrango = Carnes(rawValue: 1 << 1)
   public static let salmão = Carnes(rawValue: 1 << 2)
   public static let vegetariano = Carnes(rawValue: 1 << 3)
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

//aqui o PRODUTO macarrao
public struct Macarrao{
 
    public let massa: Massa
    public let carne: Carnes
    public let molho: Molhos
    
    public var description: String {
        return "Macarrao de massa \(massa) com \(carne) e molho \(molho)"
    }
    
    func printDescription(){
        print(description)
    }
}

// aqui o builder, que fica responsavel por toda a lógica de cada passo para a construcao do macarrao
public class MacarraoBuilder{
    
    public private(set) var carnes: Carnes = []
    public private(set) var massa: Massa = .talharim
    public private(set) var molhos: Molhos = []
    
    
    public func addCarne(_ carne: Carnes){
        self.carnes.insert(carne)
    }
    public func removeCarne(_ carne: Carnes){
        self.carnes.remove(carne)
    }
    
    public func addMolho(_ molho: Molhos){
        self.molhos.insert(molho)
    }
    public func removeMoleho(_ molho: Molhos){
           self.molhos.remove(molho)
    }
    
    public func setMassa(_ massa: Massa){
        self.massa = massa
    }
    public func build() -> Macarrao{
        return Macarrao(massa: massa, carne: carnes, molho: molhos)
    }
}

//aqui o diretor que define a ordem q as coisas devem ser feitas
public class Cozinheiro{
    public static let shared = Cozinheiro()
    func createMacarrao1() ->  Macarrao{
        let builder = MacarraoBuilder()
        builder.setMassa(.talharim)
        builder.addCarne(.salmão)
        builder.addMolho(.quatroQueijo)
        builder.addMolho(.maionese)
        return builder.build()
    }
    
    func createMacarrao2() -> Macarrao{
        let builder = MacarraoBuilder()
        builder.setMassa(.fino)
        builder.addCarne(.bife)
        builder.addMolho(.deTomate)
        builder.addCarne(.peitoDeFrango)
        return builder.build()
    }
}

//o cliente seria o responsavel por atrelar o builder a um diretor, isso geralmente é feito através de passsagem de parametro
let cozinheiro = Cozinheiro()
let prato1 = cozinheiro.createMacarrao1()
let prato2 = cozinheiro.createMacarrao2()

prato1.printDescription()

prato2.printDescription()



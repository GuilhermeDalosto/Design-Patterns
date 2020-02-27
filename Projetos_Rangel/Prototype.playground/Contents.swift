import UIKit

//Prototype é um design pattern que nos permite fazer cópia de um objeto, para isso precisamos de dois tipos. Um protocolo "Copying" que tenha um método de cópia e um class prototype que assina esse protocolo. A grande vantagem desse pattern é podemos fazer uma cópia identica do objeto e todas suas depedências e propriedades, já que podemos ter acesso até mesmo as properties private.

//Geralmente se o padrão Prototype quando seu código não quer depender de classes concretas de objetos, então você precisa copia-los. Isso acontece muito quando seu código trabalha com objetos passados para você a partir de código de terceiros por meio de alguma interface. As classes concretas desses objetos são desconhecidas e você não pode depender delas, mesmo que queira. Além disso, com esse pattern você reduz o número de subclasses, pois você pode seta vários objetos pré moldados.

//Obs: Se estamos lidando com subclasses devemos sempre chamar o construtor pai para termos certeza que iremos fazer a copia de todas as properties privadas


//aqui criamos o protocolo que no permite fazer uma copia com as mesmas referencias do objeto
//declaramos in init e um metodo de copia q retorna um init passando a referencia do proprio objeto
protocol Copying: class{
    
    init(_ source: Self)
}

extension Copying{
    func copy()->Self{
        return type(of: self).init(self)
    }
}


//aqui criamos o uma class que implementa o protocoloco Copying
public class Shape: Copying{
    
    var x: CGFloat
    var y: CGFloat
    var color: UIColor
    
    init(x: CGFloat, y: CGFloat, color: UIColor) {
        self.x = x
        self.y = y
        self.color = color
    }
    
    //criamos esse construtor para entrar em conformidade com o protocolo copying
    public required convenience init(_ shape: Shape) {
        self.init(x: shape.x, y: shape.y, color: shape.color)
    }
    
}


public class Square: Shape{

    var width: CGFloat
    var height: CGFloat

     init(x: CGFloat, y: CGFloat, color: UIColor, width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
        super.init(x: x, y: y, color: color)
    }
    
    
    //temos que implementar os init para entrar em conformidade e temos que fazer esse cast forçado para podermos fazer uma cópia legítima
    public required convenience init(_ shape: Shape) {
        let shape = shape as! Square
        self.init(x: shape.x, y: shape.y, color: shape.color, width: shape.width, height: shape.height)
    }
    
  
    
}

public class Circle: Shape{
    
    var radious: CGFloat
    
    init(x: CGFloat, y: CGFloat, color: UIColor, radious: CGFloat) {
        self.radious = radious
        super.init(x: x, y: y, color: color)
    }
    
    public required convenience init(_ shape: Shape){
         let shape = shape as! Circle
        self.init(x: shape.x, y: shape.y, color: shape.color, radious: shape.radious)
        
       
    }
    
}

//aqui temos o clinete e testamos o método de copia.
var shapes:[Shape] = [Shape]()


let square = Square(x: 50, y: 20, color: .blue, width: 50, height: 50)
shapes.append(square)
shapes.append(square.copy())

let circle = Circle(x: 30, y: 0, color: .yellow, radious: 30)
shapes.append(circle)


for shape in shapes{
    print(shape)
}

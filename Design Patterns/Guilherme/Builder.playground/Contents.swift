import UIKit


let aux = BossBuilder()

func create(){
    aux.setAttributes(hp: 10, mp: 5)
    aux.setStructure(age: 921, height: 4.31)
    aux.setStatistics(name: "Yhelm", level: 3)
    let Yhelm = aux.build()    
}

create()

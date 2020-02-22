/*:
 [Previous](@previous)
 
 # Flyweight
 - - -
 
 ![](Flyweight_diagram.png)
 
 É um structural design pattern que nos permite armazenar mais objetos na memória compartilhando estados iguais desses objetos entre si, em vez de manter esses estados em cada objeto.
 Um objeto pode ter dois tipos de propriedades: contantes (que não são alterados por outros objetos) e mutáveis (que são alterados), são chamados de intrinsic e extrinsic, respectivamente. Esse pattern sugere que paremos de armazenar os atributos extrinsics dentro da classe. Um objeto que armazena apenas seus atributos intrinsic é chamado de flyweight.
 
 Mas ainda assim não precisaríamos instanciar quantos objetos necessário forem para nossa aplicação? Sim, mas os flyweight (apenas instrinsics), não instanciaríamos os atributos extrinsics, o que economizaria muita memória.
 
 ## Code Example
 
 */

//: [Next](@next)

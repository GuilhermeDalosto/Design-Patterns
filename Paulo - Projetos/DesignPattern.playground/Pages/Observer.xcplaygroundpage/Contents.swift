/*:
[Previous](@previous)

# Observer
- - - - - - - - - -
![Observer Diagram](Observer_Diagram.png)

The observer pattern allows "observer" objects to register for and receive updates whenever changes are made to "subject" objects.

This pattern allows us to define "one-to-many" relationships between many observers receiving updates from the same subject.

## Code Example
*/
import Combine


public class User {
    
    @Published var name: String
    
    public init(name: String) {
        self.name = name
    }
}


let user = User(name: "Paulo")
print(1)
let publisher = user.$name
print(2)

var subscriber = publisher.sink() { (newVal) in
    print("User's name is \(newVal)")
}

print(4)
user.name = "Ricardo"
//:[Next](@next)

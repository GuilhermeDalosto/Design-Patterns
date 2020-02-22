/*:
 # Facade
 - - - - - - - - - -
 ![Multicast Delegate Diagram](Facade_Diagram.png)

 The facade pattern is a structural pattern that provides a simple interface to a complex system. It involves two types:

 1. The **facade** provides simple methods to interact with the system. This allows consumers to use the facade instead of knowing about and interacting with multiple classes in the system.

 2. The **dependencies** are objects owned by the facade. Each dependency performs a small part of a complex task.

 ## Code Example
 */
import Foundation

// MARK: - Dependencies
public struct Customer {
    public let identifier: String
    public var address: String
    public var name: String
}


extension Customer: Hashable {

    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }

    public static func ==(lhs: Customer, rhs: Customer) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}


public struct Product {
    public let identifier: String
    public var name: String
    public var cost: Double
}


extension Product: Hashable {

    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }

    public static func == (lhs: Product,rhs: Product) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}


public class InventoryDatabase {
    public var inventory: [Product: Int] = [:]

    public init(inventory: [Product: Int]) {
        self.inventory = inventory
    }
}


public class ShippingDatabase {
    public var pendingShipments: [Customer: [Product]] = [:]
}


// MARK: - Facade
public class OrderFacade {

    public let inventoryDatabase: InventoryDatabase
    public let shippingDatabase: ShippingDatabase

    public init(inventoryDatabase: InventoryDatabase, shippingDatabase: ShippingDatabase) {
        self.inventoryDatabase = inventoryDatabase
        self.shippingDatabase = shippingDatabase
    }


    public func placeOrder(for product: Product, by customer: Customer) {
        
        print("Place order for '\(product.name)' by '\(customer.name)'")

        let count = inventoryDatabase.inventory[product, default: 0]
        guard count > 0 else {
            print("'\(product.name)' is out of stock!")
            return
        }

        inventoryDatabase.inventory[product] = count - 1

        var shipments = shippingDatabase.pendingShipments[customer, default: []]
        shipments.append(product)
        shippingDatabase.pendingShipments[customer] = shipments

        print("Order placed for '\(product.name)' " + "by '\(customer.name)'")
    }
}


// MARK: - Example
let camisa = Product(identifier: "product-001", name: "Camisa", cost: 50)
let calcado = Product(identifier: "product-002", name: "Calçado", cost: 150)

let inventoryDatabase = InventoryDatabase(inventory: [camisa: 50, calcado : 1])
let orderFacade = OrderFacade(inventoryDatabase: inventoryDatabase, shippingDatabase: ShippingDatabase())

let customer = Customer(identifier: "customer-001", address: "1600 Pennsylvania Ave, Washington, DC 20006", name: "Rick Ricardo")

orderFacade.placeOrder(for: calcado, by: customer)
//: [Next](@next)

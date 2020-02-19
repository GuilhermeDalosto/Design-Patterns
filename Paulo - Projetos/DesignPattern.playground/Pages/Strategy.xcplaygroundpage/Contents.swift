/*:
[Previous](@previous)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Next](@next)

# Strategy
- - - - - - - - - -
![Strategy Diagram](Strategy_Diagram.png)

The strategy pattern defines a family of interchangeable objects.

This pattern makes apps more flexible and adaptable to changes at runtime, instead of requiring compile-time changes.

## Code Example
*/

import Foundation
import UIKit


public protocol MovieRatingStrategy {
    var ratingServiceName: String { get }

    func fetchRating(for movieTitle: String, success: (_ rating: String, _ review: String) -> ())
}


public class RottenTomatoesClient: MovieRatingStrategy {
    public let ratingServiceName = "Rotten Tomatoes"

    public func fetchRating(for movieTitle: String, success: (_ rating: String, _ review: String) -> ()) {

        // In a real service, we’d make a network request...
        // Here, we just provide dummy values...
        let rating = "95%"
        let review = "It rocked!"
        success(rating, review)
    }
}


public class IMDbClient: MovieRatingStrategy {
    public let ratingServiceName = "IMDb"

    public func fetchRating(for movieTitle: String, success: (_ rating: String, _ review: String) -> ()) {

        let rating = "3 / 10"
        let review = """
        It was terrible! The audience was throwing rotten
        tomatoes!
        """
        success(rating, review)
    }
}


// Em alguns casos é mais vantajoso utilizar closures do que classes inteiras de Strategies.
let strategiesInClosures: [(_ movieTitle: String, _ success: (_ rating: String, _ review: String) -> ()) -> ()] = [
    { (movieTitle, success) in
        let rating = "95%"
        let review = "It rocked!"
        success(rating, review)
    },
    { (movieTitle, success) in
        let rating = "3 / 10"
        let review = """
        It was terrible! The audience was throwing rotten
        tomatoes!
        """
        success(rating, review)
    }
]


// Podemos usar essa função dentro de uma tableView/Collection/PickerView ou de uma
// segmented control.
/* Com esse setter a strategy pode ser trocada em tempo de execução.
public func setStrategy(strategy: MovieRatingStrategy) {
    movieRatingClient = strategy
}
*/


public var ratingServiceNameLabel: String = ""
public var ratingLabel: String = ""
public var reviewLabel: String = ""

public var movieRatingClient = IMDbClient()
ratingServiceNameLabel = movieRatingClient.ratingServiceName

//movieRatingClient.fetchRating(for: ratingServiceNameLabel) { (rating, review) in
//    ratingLabel = rating
//    reviewLabel = review
//}

strategiesInClosures[1](ratingServiceNameLabel) { (rating, review) in
    ratingLabel = rating
    reviewLabel = review
}

print(ratingLabel)
print(reviewLabel)
//: [Next](@next)

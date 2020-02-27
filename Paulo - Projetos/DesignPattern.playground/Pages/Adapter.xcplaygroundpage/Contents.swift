/*:
[Previous](@previous)

# Adapter
- - - - - - - - - -
![Adapter Diagram](Adapter_Diagram.png)

The adapter pattern allows incompatible types to work together. It involves four components:

1. An **object using an adapter** is the object that depends on the new protocol.

2. The **new protocol** that is desired to be used.

3. A **legacy object** that existed before the protocol was made and cannot be modified directly to conform to it.

4. An **adapter** that's created to conform to the protocol and passes calls onto the legacy object.

## Code Example
*/
import UIKit

// MARK: - Legacy Object
/// Classe Third-party que não pode ser alterada.
public  class GoogleAuthenticator {
    public func login(email: String, password: String, completion: @escaping (GoogleUser?, Error?) -> Void) {

        // Make networking calls that return a token string (Exemplo)
        let token = "special-token-value"

        let user = GoogleUser(email: email, password: password, token: token)
        completion(user, nil)
    }
}


public struct GoogleUser {
    public var email: String
    public var password: String
    public var token: String
}


// MARK: - New Protocol
// Poderíamos extender a classe GoogleAuthenticator para assinar esse protocolo (também seria
// considerado um Adapter. Nesse caso vamos criar uma classe Adapter.
public protocol AuthenticationService {
  func login(email: String, password: String, success: @escaping (User, Token) -> Void, failure: @escaping (Error?) -> Void)
}


public struct User {
    public let email: String
    public let password: String
}


public struct Token {
    public let value: String
}


// MARK: - Adapter
// (Entre o GoogleAuthenticator e AuthenticationService)
public class GoogleAuthenticatorAdapter: AuthenticationService {
  
    private var authenticator = GoogleAuthenticator()

    public func login(email: String, password: String, success: @escaping (User, Token) -> Void, failure: @escaping (Error?) -> Void) {

        authenticator.login(email: email, password: password) { (googleUser, error) in
            
            guard let googleUser = googleUser else {
                failure(error)
                return
            }
            let user = User(email: googleUser.email, password: googleUser.password)
            let token = Token(value: googleUser.token)
            success(user, token)
        }
    }
}


// MARK: - Object Using an Adapter
public class LoginViewController: UIViewController {

    public var authService: AuthenticationService!
    
    var emailTextField = UITextField()
    var passwordTextField = UITextField()

    
    public class func instance(with authService: AuthenticationService) -> LoginViewController {
        
        let viewController = LoginViewController()
        viewController.authService = authService
        return viewController
    }

    
    public func login() {
        
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            print("Email and password are required inputs!")
            return
        }
        
        self.authService.login(email: email, password: password, success: { user, token in
            print("Auth succeeded: \(user.email), \(token.value)")
        }, failure: { _ in
            print("Auth failed with error: no error provided")
        })
    }
}


// MARK: - Example
let viewController = LoginViewController.instance(with: GoogleAuthenticatorAdapter())
viewController.emailTextField.text = "user@example.com"
viewController.passwordTextField.text = "password"
viewController.login()
//:[Next](@next)
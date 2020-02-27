import UIKit

func printTest2(_ result: @autoclosure () -> Bool) {
    print("Before")
    result()
    print("After")
}

printTest2(1 > 2)
// podemos passar uma condição ele só executa se a condição for verdaddeira

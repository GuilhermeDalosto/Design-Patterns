import UIKit

//problema da torre e os piões
public let input: [[Character]] =  [[".",".",".",".",".",".",".","."],[".","p","p","p","p","p",".","."],[".","p","p","B","p","p",".","."],[".","p","B","R","B","p",".","."],[".","p","p","B","p","p",".","."],[".","p","p","p","p","p",".","."],[".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".","."]]

public class Solution{
    
    
    func numRookCaptures(_ board: [[Character]]) -> Int {
        var colunm: Int = 0
        var row: Int = 0
        var contador = 0
        for i in 0...7{
            for j in 0...7{
                if board[i][j] == "R"{
                    row = i
                    colunm = j
                }
            }
        }
        
        let rook = (row: row, column: colunm)
        //east
        for i in row..<8 {
            if board[row][i] == "B"{
                break
            }else if board[row][i] == "p"{
                contador+=1
                break
            }
        }
        //west
        for i in (0...rook.row).reversed() {
            if board[row][i] == "B"{
                break
            }else if board[row][i] == "p"{
                contador+=1
                break
            }
        }
        //south
        for i in colunm..<8{
            if board[i][colunm] == "B"{
                break
            }else if board[i][colunm] == "p"{
                contador+=1
                break
            }
        }
        //north
        for i in (0...rook.column).reversed()  {
            if board[i][colunm] == "B"{
                break
            }else if board[i][colunm] == "p"{
                contador+=1
                break
            }
        }
       
        
        return contador
        
    }
    
}
let solution = Solution()

//print("A resposta é: \(solution.numRookCaptures(input))")

//Problema do backspace

class Solution2 {
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        
        var s = S, t = T
        for _ in 0..<s.count{
            if let index = s.firstIndex(of: "#"){
                
                if s.distance(from: s.startIndex, to: index) != 0 {
                    let indexBefore = s.index(before: index)
                    s.removeSubrange(indexBefore...index)
                }else{
                    s.remove(at: index)
                }
            }
        }
        for _ in 0..<t.count{
            if let index = t.firstIndex(of: "#"){
    
                if t.distance(from: t.startIndex, to: index) != 0 {
                    let indexBefore = t.index(before: index)
                    t.removeSubrange(indexBefore...index)
                }else{
                    t.remove(at: index)
                }
            }
        }
     
        return s == t
    }
}

let S = "a##c"

, T = "#a#c"

let S2 = "xywrrmp"
let T2 = "xywrrmu#p"
let solution2 = Solution2()

//print("A resposta é: \(solution2.backspaceCompare(S, T))")

//Problema de qual a melhor ação para comprar
class Solution3 {
    func maxProfit(_ prices: [Int]) -> Int {
        var result = 0
        var profit = 0
        for (i, price) in prices.enumerated(){
            for indice in i+1..<prices.count{
                result = prices[indice] - price
                if result > profit{
                    profit = result
                }
            }
        }
        return profit
    }
}
let input3 = [2,4,1]


let s3 = Solution3()
print("A resposta é: \(s3.maxProfit(input3))")

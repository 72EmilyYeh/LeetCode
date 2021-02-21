//: [Previous](@previous)

import Foundation

class Solution {
    enum Roman: String {
        case I
        case V
        case X
        case L
        case C
        case D
        case M
        
        var decimal: Int {
            switch self {
            case .I: return 1
            case .V: return 5
            case .X: return 10
            case .L: return 50
            case .C: return 100
            case .D: return 500
            case .M: return 1000
            }
        }
        
        /**
         I can be placed before V (5) and X (10) to make 4 and 9.
         X can be placed before L (50) and C (100) to make 40 and 90.
         C can be placed before D (500) and M (1000) to make 400 and 900
         */
        
        // last level prefix count: 1, last level suffix maximum count = 3
        func isNextTwoLevel(of roman: Roman) -> Bool {
            switch roman {
            case .I:   return (self == .V || self == .X)
            case .X:   return (self == .L || self == .C)
            case .C:   return (self == .D || self == .M)
            default:
                return false
            }
        }
    }

    func romanToInt(_ s: String) -> Int {
        if s.count <= 1 {
            return Roman(rawValue: s)?.decimal ?? 0
        }
        
        var decimal: Int = 0
        var symbolCount: Int = 0
        var lastRoman: Roman!
        
        for romanChar in Array(s) {
            guard let roman = Roman(rawValue: String(romanChar)) else {
                return decimal
            }

            if lastRoman == nil {
                lastRoman = roman
                decimal += roman.decimal
                symbolCount += 1
            } else {
                if roman == lastRoman {
                    if symbolCount < 3 {
                        decimal += roman.decimal
                        symbolCount += 1
                    } else {
                        symbolCount = 1
                        return decimal
                    }
                } else {
                    if roman.isNextTwoLevel(of:lastRoman) {
                        decimal += (roman.decimal - lastRoman.decimal * 2)
                    } else {
                        decimal += roman.decimal
                    }
                    lastRoman = roman
                    symbolCount = 1
                }
            }
        }
        
        return decimal
    }
}


let solution = Solution()
let s1 = "III" // output:3
solution.romanToInt(s1)
let s2 = "IV"  // output:4
solution.romanToInt(s2)
let s3 = "IX"  // output:9
solution.romanToInt(s3)
let s4 = "LVIII" // output: 58, L = 50, V= 5, III = 3.
solution.romanToInt(s4)


//: [Next](@next)

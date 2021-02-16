//: [Previous](@previous)


import UIKit

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }
        
        let charArrayOfS = Array(s)
        let charArrayOfT = Array(t)
        var dict: [Character: Int] = [:]
        
        for i in 0..<charArrayOfS.count {
            let char = charArrayOfS[i]
            let lastIndex = (dict[char] == nil) ? 0 : dict[char]! + 1
            
            if let index = charArrayOfT[lastIndex..<charArrayOfT.endIndex].firstIndex(of: char) {
                dict[char] = index
                continue
            } else {
                return false
            }
        }
        return true
    }
}


//: [Next](@next)

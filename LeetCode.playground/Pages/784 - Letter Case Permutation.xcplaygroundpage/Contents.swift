//: [Previous](@previous)

class Solution {
    func letterCasePermutation(_ S: String) -> [String] {
        guard let char = S.first else { return [] }
        var prefix: [String] = []
        if char.isLetter {
            prefix = [String(char.lowercased()), String(char.uppercased())]
        } else {
            prefix = [String(char)]
        }
            
        if S.count > 1 {
            let subLetterCaseStrings = letterCasePermutation(String(S.dropFirst()))
            var substrings: [String] = []
            
            for i in 0..<prefix.count {
                for j in 0..<subLetterCaseStrings.count {
                    substrings.append(prefix[i] + subLetterCaseStrings[j])
                }
            }
        
            return substrings
        } else {
            return prefix
        }
    }
}

let solution = Solution()
let S1 = "a1b2"
solution.letterCasePermutation(S1)

let S2 = "3z4"
solution.letterCasePermutation(S2)

let S3 = "12345"
solution.letterCasePermutation(S3)

let S4 = "0"
solution.letterCasePermutation(S4)
//: [Next](@next)

//: [Previous](@previous)

import Foundation

class Solution {
    // Solution is correct, but performance is poor. The answer is not accepted by leetcode.
    func maxArea(_ height: [Int]) -> Int {
        if height.count <= 1 {
            return 0
        } else if height.count == 2 {
            return min(height.first!, height.last!)
        }

        let w = height.count - 1
        let h = min(height.first!, height.last!)
        let area = w * h
        
        let leftSubArray = Array(height[height.startIndex..<height.endIndex-1])
        let rightSubArray = Array(height[height.startIndex+1..<height.endIndex])
        
        return max(area, maxArea(leftSubArray), maxArea(rightSubArray))

    }
}

let solution = Solution()
let h1 = [1,8,6,2,5,4,8,3,7]
let a1 = solution.maxArea(h1)

let h2 = [1,1] // = 1 * 1 = 1
solution.maxArea(h2)

let h3 = [4,3,2,1,4] // = 4 * 4 = 16
solution.maxArea(h3)

let h4 = [1,2,1] // = 2 * 1 = 2
solution.maxArea(h4)

let h5 = [1,3,2] // = 2 * 1 = 2
solution.maxArea(h5)

let h6 = [3,1,2] // = 2 * 2 = 4
solution.maxArea(h6)


//: [Next](@next)

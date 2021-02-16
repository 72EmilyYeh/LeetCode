//: [Previous](@previous)

class Solution {
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        if k < 1 || k > mat.count {
            return []
        }
        
        var soldiersInRows: [(index: Int, soldiers: Int)] = []
        for i in 0..<mat.count {
            let row = mat[i]

            var soldiersInCurrentRow: (index: Int, soldiers: Int)!
            if let firstZeroIndex = row.firstIndex(of: 0) {
                soldiersInCurrentRow = (i, row[row.startIndex..<firstZeroIndex].count)
            } else {
                soldiersInCurrentRow = (i, row.count)
            }
            soldiersInRows.append(soldiersInCurrentRow)
        }
        
        soldiersInRows.sort { (lhs, rhs) -> Bool in
            lhs.soldiers < rhs.soldiers
        }
        
        var theWeakestRows: [Int] = []
        for i in 0..<k {
            theWeakestRows.append(soldiersInRows[i].index)
        }
        
        return soldiersInRows[0..<k].compactMap { $0.index }
    }
}

let mat =
    [[1,0,0,0],
     [1,1,1,1],
     [1,0,0,0],
     [1,0,0,0]]
let k = 2
// [2,0,3,1,4]

let solution = Solution()
solution.kWeakestRows(mat, k)

//: [Next](@next)

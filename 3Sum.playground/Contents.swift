func threeSum(_ nums: [Int]) -> [[Int]] {
    var result: [[Int]] = []
    var digitsDict: [Int: Int] = [:]
    var newNums: [Int] = []
    nums.sorted().forEach { value in
        digitsDict[value] = digitsDict[value] == nil ? 1 : digitsDict[value]! + 1
        if digitsDict[value] ?? 0 < 4 {
            newNums.append(value)
        }
    }
    let zeros = newNums.filter { $0 == 0 }
    if zeros.count == newNums.count {
        return [[0, 0, 0]]
    }
    if newNums.filter { $0 <= 0 }.isEmpty {
        return []
    }
    let max = newNums.max()
    for index in 0..<newNums.count - 2 {
        let first = newNums[index]
        for index2 in index + 1...newNums.count - 2 {
            let second = newNums[index2]
            let part = first + second
            if part > max ?? 0 { continue }
            for index3 in stride(from: newNums.count - 1, to: index2, by: -1) {
                if newNums[index3] == part * -1 {
                    let val = [first, second, newNums[index3]].sorted()
                    if !result.contains(val) {
                        result.append(val)
                    }
                }
                continue
            }
        }
    }
    return result
}
threeSum(
    [1,1,-2]
)

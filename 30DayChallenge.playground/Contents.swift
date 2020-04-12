import UIKit

func singleNumber(_ nums: [Int]) -> Int {
    var dict = [Int:Int]()
    
    for num in nums {
        dict[num] = dict[num, default: 0] + 1
    }
    for (k,v) in dict {
        if v == 1 {
            return k
        }
    }
    return -1
}




func isHappy(_ n: Int) -> Bool {
    var n = n
    var visited = Set<Int>()
    while n > 1 {
        guard !visited.contains(n) else { return false}
        visited.insert(n)
        n = sumOfSquaresOfDigits(of: n)
    }
    return true
}
func sumOfSquaresOfDigits(of n: Int) -> Int {
    var n = n
    var result = 0
    while n > 0 {
        result += Int(pow(Double(n % 10), 2))
        n /= 10
    }
    return result
}


class Node {
    var val: Int
    var next: Node?
    
    init(_ val: Int) {
        self.val = val
    }
}


func maxSubArray(nums: [Int]) -> Int {
    var currentLargestSum = nums.first ?? -1
    var currentSum = currentLargestSum
    for i in 1..<nums.count {
          let result = currentSum + nums[i]
        
        if result > nums[i] {
            currentSum = result
        } else {
            currentSum = nums[i]
        }
        if currentSum > currentLargestSum {
            currentLargestSum = currentSum
        }
        
    }
    return currentLargestSum
    
}

let myArr = [-2,1,-3,4,-1,2,1,-5,4]

//maxSubArray(nums: myArr)


func moveZeroes(_ nums: inout [Int]) {
        var zeroIndex  = [Int]()
        var currentIndex = 0
        var swapCount = 0
        for num in nums {
            if num == 0 {
                zeroIndex.append(currentIndex)
            }
            currentIndex += 1
        }
        for index in zeroIndex {
            let newIndex = index - swapCount
            nums.remove(at: newIndex)
            nums.append(0)
            swapCount += 1
        }
    }
    




var nums = [4,0,2,1,0,0,5]



//moveZeroes(&nums)


func maxProfit(_ prices: [Int]) -> Int {
guard prices.count > 1 else {
    return 0
}
var profit = 0
for index in 1..<prices.count {
    if prices[index] > prices[index - 1] {
        profit += prices[index] - prices[index - 1]
    }
}
return profit

}



func groupAnagrams(_ strs: [String]) -> [[String]] {
    var matrix = [[String]]()
    
    var dict = [String: [String]]()
    
    for str in strs {
        let sortedStr = str.sorted().map { (c) -> String in
            return String(c)
        }
        let joinedStr = sortedStr.joined()
        
        if dict[joinedStr] != nil {
            dict[joinedStr]?.append(str)
        } else {
            dict[joinedStr] = [str]
        }
    }
    
    for arr in dict.values {
        matrix.append(arr)
    }
    
    return matrix
}


let words = ["eat", "tea", "tan", "ate", "nat", "bat"]

//groupAnagrams(words)



func countElements(_ arr: [Int]) -> Int {
    var count = 0
    
    for num in arr {
        if arr.contains(num + 1) {
            count += 1
        }
    }
    return count 
}


struct Stack<Element>: Equatable where Element: Equatable {
    static func == (lhs: Stack<Element>, rhs: Stack<Element>) -> Bool {
        return lhs.array == rhs.array
    }
    
    private var array: [Element] = []
    
   
    mutating func pop() -> Element? {
        return array.popLast()
    }
    
    func peek() -> Element? {
        return array.last
    }
    
    mutating func push(_ element: Element) {
        array.append(element)
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    
}



func backspaceCompare(_ S: String, _ T: String) -> Bool {
    var stack1 = Stack<Character>()
    var stack2 = Stack<Character>()
    
    for c in S {
        if c == "#" {
            stack1.pop()
        } else {
            stack1.push(c)
        }
    }
    
    for c in T {
        if c == "#" {
            stack2.pop()
        } else {
            stack2.push(c)
        }
    }
    
    return stack1 == stack2
}



class MinStack {
    
    private var arr: [Int]
    private var minArr: [Int]

    /** initialize your data structure here. */
    init() {
        self.arr = [Int]()
        self.minArr = [Int]()
    }
    
    func push(_ x: Int) {
        if let min = minArr.last {
            if x <= min {
                minArr.append(x)
            }
        } else {
            minArr.append(x)
        }
        
        arr.append(x)
    }
    
    func pop() {
        if let top = arr.last {
            arr.popLast()
            if let min = minArr.last {
                if top == min {
                    minArr.popLast()
                }
            }
        } else {
            return
        }
    }
    
    func top() -> Int {
        if let last = arr.last {
            return last
        }
        return Int.min
    }
    
    func getMin() -> Int {
        if let last = minArr.last {
            return last
        }
        return Int.min
    }
}


//var diameter = 0

//func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
//    maxDepth(root)
//    
//    return diameter
//}
//
//fileprivate func maxDepth(_ node: TreeNode?) -> Int {
//    guard let node = node else {
//        return 0
//    }
//    
//    let (left, right) = (maxDepth(node.left), maxDepth(node.right))
//    
//    diameter = max(diameter, left + right)
//    
//    return max(left, right) + 1
//}

var stones = [2,7,4,1,8,1]
func lastStoneWeight(_ stones: [Int]) -> Int {
      var stones = stones
    
    while stones.count > 1 {
        stones = stones.sorted(by: >)
        
        let heaviest = stones[0]
        let secondHeaviest = stones[1]
        
        if heaviest == secondHeaviest {
            stones = Array(stones[2...])
        } else {
            stones[0] = heaviest - secondHeaviest
            stones.remove(at: 1)
        }
    }
    
    if !stones.isEmpty {
        return stones[0]
    }
    return 0
}

lastStoneWeight(stones)

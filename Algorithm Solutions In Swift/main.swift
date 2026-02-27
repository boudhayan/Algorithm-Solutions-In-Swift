import Foundation

func singleNumber1(_ nums: [Int]) -> Int {
    var x = nums[0]
    for i in 1..<nums.count {
        x = x^nums[i]
    }
    return x
}

var array = [2,2,1]//[0,0,1,1,1,2,2,3,3,4]
print(singleNumber1(array))
